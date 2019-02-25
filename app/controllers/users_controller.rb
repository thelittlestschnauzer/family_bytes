class UsersController < ApplicationController
before_action :set_user, only: [:profile, :edit, :update, :destroy]
before_action :redirect_if_unauthorized_user!, only: [:update, :edit, :destroy]
before_action :correct_user, only: [:edit, :update]

  def new 
    @user = User.new 
  end 

  def profile 
     
  end 

  def create 
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id 
      flash[:messge] = "Successfully Created Account!"  
      redirect_to 'chapter/recipes'
    else
      render :new
    end 
  end 

  def edit
    
  end 

  def update
    if @user.update(user_params)
      flash[:message] = "Profile Updated"
      redirect_to user_path
    else 
      render :edit 
    end  
  end 

  def destroy 
    @user.destroy 
    flash[:message] = "User was successfully deleted"
    redirect_to '/login'
  end 
  
  private 

  def user_params 
    params.require(:user).permit(:first_name, :email, :password, :password_confirmation)
  end 

  def set_user
    @user = User.find(params[:id])
  end 

  def redirect_if_unauthorized_user!
    if !@user = current_user 
      redirect_to '/login'
    end 
  end 

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless @user == current_user
  end 
end  