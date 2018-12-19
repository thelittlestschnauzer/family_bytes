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

    user 
  end
end 

