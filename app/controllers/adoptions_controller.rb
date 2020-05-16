class AdoptionsController < ApplicationController
  def new
  end

  def create
    # binding.pry
    if Adoption.create(adoption_params)
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
