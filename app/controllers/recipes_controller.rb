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
    respond_to do |format|
      format.html {render :index }
      format.json { render :json }
    end
  end 
  

  def new 
		@recipe = current_user.recipes.build     
  end 

  def create
    @recipe = current_user.recipes.build(recipe_params)
    @recipe.image.attach(params[:recipe][:image])

    if @recipe.save
      redirect_to chapter_recipe_path(@recipe.chapter_id, @recipe)
    else
      render :new 
    end 
  end 


  def show 
    @recipe = Recipe.find(params[:id])
    @reviews = @recipe.reviews.all 
    @review = @recipe.reviews.build 
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

  def search 
    @recipes = Recipe.search(params[:keyword])
  end 


  private 

  def recipe_params
    params.require(:recipe).permit(:name, :level, :serve, :chapter_id, :image, :keyword, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :method, :_destroy])
  end 

  def get_chapter
    @chapter = Chapter.find(params[:chapter_id]) 
  end 
end
