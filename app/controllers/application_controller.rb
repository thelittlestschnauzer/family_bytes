class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?


private 

  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def logged_in?
    !!current_user
  end 

  def redirect_if_not_logged_in!
    if !logged_in?
      flash[:message] = "You have to be logged in to complete this action"
      redirect_back fallback_location: root_path
    end 
  end
  
  def find_by_recipe_id
    Recipe.find_by(id: params[:recipe_id])
  end
end    
