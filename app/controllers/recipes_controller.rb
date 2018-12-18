class RecipesController < ApplicationController

  def index
    if params[:chapter_id]
      @chapter = Chapter.find_by(id: params[:chapter_id])
      if @chapter.nil?
        redirect_to chapters_path, "Chapter not found"
      else
       @recipes = @chapter.recipes 
      end 
    else 
      @recipes = Recipe.all     
    end
  end 

  def new 
    @recipe = Recipe.new
    #@recipe = Recipe.new(chapter_id: params[:chapter_id])
    @recipe.ingredients.build 
  end 

  def create
    @recipe = Recipe.create(recipe_params)
    @recipe.image.attach(params[:recipe][:image])
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

  def destroy 
    @recipe = Recipe.find(params[:id])
    @recipe.destroy 
    redirect_to chapter_recipes_path(@recipe.chapter_id, @recipe)
  end 


  private 

  def recipe_params
    params.require(:recipe).permit(:name, :level, :serve, :chapter_id, :image, ingredients_attributes: [:name, :_destroy, recipe_details: [:instruction]])
  end 

  def get_chapter
    @chapter = Chapter.find(params[:chapter_id]) 
  end 
end
