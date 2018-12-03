class Recipe < ApplicationRecord
  validates :name, :level, :serve, presence: true 

  belongs_to :chapter, optional: true
  has_many :recipe_details
  has_many :ingredients, through: :recipe_details

  has_one_attached :image


  accepts_nested_attributes_for :ingredients  

  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.values.each do |ingredients_attribute| 
      if !ingredients_attribute["name"].empty?
        ingredient = Ingredient.find_or_create_by(name: ingredients_attribute["name"])
        self.recipe_details.build(recipe: self, ingredient: ingredient, instruction: ingredients_attribute["recipe_details"]["instruction"])
      end
    end 
  end 
end 
