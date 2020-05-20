class PetsController < ApplicationController

    def index
        @pets = Pet.all
    end

    def new
        @shelter = Shelter.find(params[:shelter_id])
    end

    def create
        shelter = Shelter.find(params[:shelter_id])
        pet = shelter.pets.create(pet_params)
            if pet.save
                redirect_to "/shelters/#{shelter.id}/pets"
            else
                flash[:notice] = pet.errors.full_messages.to_sentence
                redirect_to "/shelters/#{shelter.id}/pets/new"
            end
    end

    def show
        @pet = Pet.find(params[:pet_id])
    end

    def edit
        @pet = Pet.find(params[:pet_id])
    end

    def update
        pet = Pet.find(params[:pet_id])
        pet.update(pet_params)
        if pet.save
            redirect_to "/pets/#{pet.id}"
        else
            flash[:notice] = pet.errors.full_messages.to_sentence
            redirect_to "/pets/#{pet.id}/edit"
        end

    end

    def destroy
        pet = Pet.find(params[:pet_id])
        favorites.delete_fav_pet(pet.id)
        Pet.destroy(params[:pet_id])
        redirect_to "/pets"
    end

    private

    def pet_params
        params.permit(:name, :image, :sex, :description, :age)
    end
end
