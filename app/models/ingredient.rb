class Ingredient < ApplicationRecord
  has_many :recipe_details
  has_many :recipes, through: :recipe_details 

  validates :name, presence: true 

  # accepts_nested_attributes_for :recipe_details
end
