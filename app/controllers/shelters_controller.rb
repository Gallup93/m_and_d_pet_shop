class SheltersController < ApplicationController

    def index
        @shelters = Shelter.all
    end

    def new; end

    def create
        shelter = Shelter.new(shelter_params)
        if shelter.save
            redirect_to "/shelters"
        else
            flash[:notice] = "You have created a shelter shelter"
            flash[:notice] = shelter.errors.full_messages.to_sentence
            redirect_to "/shelters/new"
        end
    end
    
    def show
        @shelter = Shelter.find(params[:id])
    end

    def edit
        @shelter = Shelter.find(params[:id])
    end

    def update
        shelter = Shelter.find(params[:id])
        shelter.update(shelter_params)
        if shelter.save
            redirect_to "/shelters/#{shelter.id}"
        else 
            flash[:notice] = shelter.errors.full_messages.to_sentence
            # render :edit
            redirect_to "/shelters/#{shelter.id}/edit"
        end
    end

    def destroy
        shelter = Shelter.find(params[:id])
        if shelter.pets.any? {|pet| pet.adoption_status == false}
            flash[:notice] = "Cannot delete this shelter with pets that pending adoptions!"
            redirect_to "/shelters/#{shelter.id}"
        else
            shelter.destroy
            redirect_to "/shelters"
        end

    end
    
    private

    def shelter_params
        params.permit(:name, :address, :city, :state, :zip)
    end
    
end

# shelter.pets.any? {|pet| pet.adoption_status == false}