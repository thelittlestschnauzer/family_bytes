class ReviewsController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = @recipe.reviews.build(review_params)
    @review.user = current_user
      @review.save! 
        redirect_to @recipe
  end 

  private 

  def review_params 
    params.require(:review).permit(:content, :rating, :recipe_id, :user_id)
  end 
end
