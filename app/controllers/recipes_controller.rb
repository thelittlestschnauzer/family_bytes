class RecipesController < ApplicationController

  def index 
    if params[:chapter_id]
      @recipes = Chapter.find(params[:chapter_id]).recipes 
    else
      @recipes = Recipe.all 
    end 
  end 

  def new 
    @recipe = Recipe.new(chapter_id: params[:chapter_id])
    @recipe.build_chapter
    # if params[:chapter_id] && !Chapter.exists?(params[:chapter_id])
    #   redirect_to chapters_path, alert: "Chapter is not available"
    # else 
    #   @recipe = Recipe.new(chapter_id: params[:chapter_id])
    # end 
  end 

  def create 
    @recipe = Recipe.create(recipe_params)
    redirect_to chapter_recipe_path(@recipe.chapter_id, @recipe)
  end 

  def show 
    @recipe = Recipe.find(params[:id])
  end 

  def edit 
    @recipe = Recipe.find(params[:id]) 
  end 

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe) 
  end 

  private 

  def recipe_params
    params.require(:recipe).permit(:name, :level, :serve, :chapter_id, :image, ingredients_attributes: [:name, :quantity, recipe_details: [:instruction]])
  end 

  def get_chapter
    @chapter = Chapter.find(params[:chapter_id]) 
  end 
end
