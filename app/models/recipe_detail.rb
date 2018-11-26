class RecipeDetail < ApplicationRecord
  belongs_to :recipe 
  belongs_to :ingredient 

  validates :instruction, presence: true 
end
