class RecipesController < ApplicationController

  

  private 

  def recipe_params
    params.require(:recipe).permit(:name, :level, :serve, :chapter_id, :image)
  end 

  def get_chapter
    @chapter = Chapter.find(params[:chapter_id]) 
  end 
end
