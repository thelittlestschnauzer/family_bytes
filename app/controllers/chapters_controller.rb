class ChaptersController < ApplicationController

  def index 
    @chapters = Chapter.all 
  end 
  
    def show
      @chapter = Chapter.find(params[:id])
      @recipes = @chapter.recipes        
    end 

  private 

  def chapter_params 
    params.require(:chapter).permit(:title)
  end 


end
