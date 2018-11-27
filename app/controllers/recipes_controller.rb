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
    if @recipe.save 
      redirect_to :controller => 'recipes', :action => 'index'
    else
      render :new 
    end 
  end 

  def show 
  end 

  private 

  def recipe_params
    params.require(:recipe).permit(:name, :level, :serve, :chapter_id, :image, ingredients_attributes: [:name, :_destroy, recipe_details: [:instruction, :_destroy]])
  end 

end
