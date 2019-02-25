class Review < ApplicationRecord
  belongs_to :recipe 
  belongs_to :user 
  
  # validates :content, presence: true 
  

  def time 
    created_at.strftime("%l:%M %P %B %e, %Y")
  end 
end
