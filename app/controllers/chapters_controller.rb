class ChaptersController < ApplicationController
  
  def show 
    @chapter = Chapter.find(params[:id])
  end 


  private 

  def chapter_params 
    params.require(:chapter).permit(:title)
  end 
end
