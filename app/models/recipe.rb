class Recipe < ApplicationRecord
  validates :name, :level, :serves, presence: true 

  belongs_to :chapter

  has_many :recipe_details
  has_many :ingredients, through: :recipe_details
end
