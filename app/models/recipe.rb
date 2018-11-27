class Recipe < ApplicationRecord
  validates :name, :level, :serve, presence: true 

  belongs_to :chapter

  has_many :recipe_details
  has_many :ingredients, through: :recipe_details

  has_one_attached :image

  
end
