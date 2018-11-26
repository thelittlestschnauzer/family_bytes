class RecipesController < ApplicationController

  def index 
     @chapter = Chapter.find(params[:chapter_id])
     @recipes = @chapter.recipes 
  end 

  def new 
    @chapter = Chapter.find(params[:chapter_id])
    @recipe = @chapter.recipes.build
  end 

  def create
    @chapter = Chapter.find(params[:chapter_id])
    @recipe = @chapter.recipes.build(recipe_params) 
  end 

  private 

  def recipe_params
    params.require(:recipe).permit(:name, :level, :serves, :chapter_id)
  end 

end
