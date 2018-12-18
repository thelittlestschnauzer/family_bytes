class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  


  protected 

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end 

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:signup)
    devise_parameter_sanitizer.for(:account_update) << :name 
  end 
end
