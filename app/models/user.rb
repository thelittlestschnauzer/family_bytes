class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :email, uniqueness: true 
  validates :password, presence: true 
  
  def self.from_omniauth(access_token)
    data = access_token.info  
    user = User.where(email: data['email']).first 

      unless user 
        user = User.create(name: data['name'],
              email: data['email'],
              password: Devise.friendly_token[0,20]
              )
      end 
    user 
  end

  def create_from_omniauth
    @user = User.find_or_create_by(email: auth[:info][:email]) do |user|
      user.name = auth[:info][:name]
      user.password = SecureRandom.hex
     
    session[:user_id] = @user.class 
      if logged_in?
        flash[:message] = "Successfully authenticated via Google"
      else
        flash[:message] = "Something went wrong"
      end 
      redirect_to root_path  
    end
  end 

  private 

  def auth 
    request.env['omniauth.auth']
  end 


end 

