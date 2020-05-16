class AdoptionsController < ApplicationController
  def new
  end

  def create
    if Adoption.create(adoption_params)
      fav_ids = params[:check_box]
      fav_ids.each{|fav| favorites.delete_fav_pet(fav.to_i)}
      flash[:notice] = "Application submitted!"
      redirect_to '/favorites'
    else
    end
  end

  private

  def adoption_params
    params.permit(:name, :address, :city, :state, :zip, :phone, :description)
  end
end
