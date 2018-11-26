class Ingredient < ApplicationRecord
  has_many :recipe_details
  has_many :recipes, through: :recipe_details 

  validates :name, presence: true 
end
