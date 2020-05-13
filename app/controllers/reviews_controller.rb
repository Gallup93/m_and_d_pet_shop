class ReviewsController < ApplicationController
  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    shelter = Shelter.find(params[:id])
    review = shelter.reviews.new(review_params)

    if review.save
      redirect_to "/shelters/#{shelter.id}"
    else
      flash[:notice] = "Form Error: please include a title, rating, and content"
      redirect_to "/shelters/#{shelter.id}/reviews/new"
    end
  end

  def edit
    @review = Review.find(params[:review_id])
  end

  def update
    review = Review.find(params[:review_id])
    if review.update(review_params)
      redirect_to "/shelters/#{params[:id]}"
    else
      flash[:notice] = "Form Error: please include a title, rating, and content"
      redirect_to "/shelters/#{params[:id]}/#{params[:review_id]}/edit"
    end
  end

  def destroy
    Review.destroy(params[:review_id])
    redirect_to "/shelters/#{params[:id]}"
  end

  private

  def review_params
    params.permit(:title, :rating, :content, :image)
  end
end
