class ChaptersController < ApplicationController
  
  
    def show 
      
      @recipe = Recipe.find(params[:id])
    end 

  private 

  def chapter_params 
    params.require(:chapter).permit(:title)
  end 


end
