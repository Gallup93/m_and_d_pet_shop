class FavoritesController < ApplicationController

  def index
    # binding.pry
  end
  

  def update
    pet = Pet.find(params[:pet_id])
    favorites.add_pet(pet.id)
    session[:favorites] = favorites.contents
    flash[:notice] = "#{pet.name} has been added to your favorites"
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    favorites.delete_fav_pet(pet.id)
    flash[:notice] = "#{pet.name} has been removed from your favorites!"
    redirect_to "/pets/#{pet.id}"
  end

  def destroy_from_index
    pet = Pet.find(params[:pet_id])
    favorites.delete_fav_pet(pet.id)
    redirect_to "/favorites"
  end

  def destroy_all
    favorites.contents.clear
    redirect_to "/favorites"
  end
  
  
  # def fav_collection

  # end
  
end