class Review < ApplicationRecord
<<<<<<< HEAD
  belongs_to :recipe 
  belongs_to :user 

  validates :review_owner, presence: true 
  validates :content, presence: true 
=======
>>>>>>> adding_reviews
  
end
