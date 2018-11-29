class ChaptersController < ApplicationController
  
  def recipes_index 
    @chapter = Chapter.find(params[:id])
    @recipes = @chapter.recipes
    render template: 'recipes/index'
  end 

  def recipe 
    @chapter = Chapter.find(params[:id])

    @recipe = Recipe.find(params[:recipe_id])
    render template: 'recipes/show'
  end 

  private 

  def chapter_params 
    params.require(:chapter).permit(:title)
  end 
end
