class RecipesController < ApplicationController

  def index 
    if params[:chapter_id]
      @recipes = Chapter.find(params[:chapter_id]).recipes 
    else
      @recipes = Recipe.all 
    end 
  end 

  def show 
    @recipe = Recipe.find(params[:id])
  end 

  private 

  def recipe_params
    params.require(:recipe).permit(:name, :level, :serve, :chapter_id, :image)
  end 

  def get_chapter
    @chapter = Chapter.find(params[:chapter_id]) 
  end 
end
