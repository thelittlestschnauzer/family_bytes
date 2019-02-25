class Direction < ApplicationRecord
  belongs_to :recipe

  validates :method, presence: true 
  
end
