class AdoptionsController < ApplicationController

  def index
    @pet = Pet.find(params[:pet_id])
  end
  
  def new
  end

  def show
    @app = Adoption.find(params[:id])
    # binding.pry
  end

  def create
    application = Adoption.create(adoption_params)

    if application.save && params[:check_box] != nil
      fav_ids = params[:check_box]
      fav_ids.each do |pet_id|
        pet = Pet.find(pet_id.to_i)
        AdoptionPet.create(pet_id: pet.id, adoption_id: application.id)
      end
      fav_ids.each{|fav| favorites.delete_fav_pet(fav.to_i)}
      flash[:notice] = "Application submitted!"
      redirect_to '/favorites'
    else
      flash[:notice] = "ERROR! Missing required form field(s)"
      redirect_to "/adoptions/new"
    end
  end

  private

  def adoption_params
    params.permit(:name, :address, :city, :state, :zip, :phone, :description)
  end
end
