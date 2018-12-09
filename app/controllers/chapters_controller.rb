class ChaptersController < ApplicationController
  
  
    def show
      @chapter = Chapter.find(params[:id])
      @recipes = @chapter.recipes        
    end 

  private 

  def chapter_params 
    params.require(:chapter).permit(:title)
  end 


end
