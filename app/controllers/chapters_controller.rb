class ChaptersController < ApplicationController

  def new 
    @chapter = Chapter.new 
  end 

  def create 
    @chapter = Chapter.create(chapter_params)
    if @chapter.save 
      redirect_to chapters_path
    else
      render :new 
    end 
  end 

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
