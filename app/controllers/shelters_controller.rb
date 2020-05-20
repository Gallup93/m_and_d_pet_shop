class SheltersController < ApplicationController

    def index
        @shelters = Shelter.all
    end

    def new; end

    def create
        Shelter.create(shelter_params)
        redirect_to "/shelters"
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
        redirect_to "/shelters/#{shelter.id}"
    end

    def destroy
        shelter = Shelter.find(params[:id])
        pet = shelter.pets.find_all do |pet|
            pet.adoption_status == "Pending Adoption"
            end
        if pet == []
            Shelter.destroy(params[:id])
            redirect_to "/shelters"
        else
            flash[:notice] = "Cannot delete this shelter with pets that pending adoptions!"
            redirect_to "/shelters/#{shelter.id}"
        end
    end
    
    private

    def shelter_params
        params.permit(:name, :address, :city, :state, :zip)
    end
    
end