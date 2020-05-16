class AdoptionsController < ApplicationController
  def new
  end

  def create
    # binding.pry
    adoption = Adoption.create(adoption_params)
    redirect_to '/favorites'
  end

  private

  def adoption_params
    params.permit(:name, :address, :city, :state, :zip, :phone, :description)
  end


end
