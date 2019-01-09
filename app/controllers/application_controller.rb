class ApplicationController < ActionController::Base
  helper_method :current_user


private 

  def current_user 
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    else
      @current_user = nil 
    end 
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
end    
