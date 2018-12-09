class Recipe < ApplicationRecord
  validates :name, :level, :serve, presence: true 

  belongs_to :chapter, optional: true
  has_many :recipe_details
  has_many :ingredients, through: :recipe_details

  has_one_attached :image

  def thumbnail
    return self.image.variant(resize: '250x250')
  end

  def large
    return self.image.variant(resize: '500x400')
  end 
  
  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.values.each do |ingredients_attribute|
       if !ingredients_attribute["name"].empty?
        ingredient = Ingredient.find_or_create_by(name: ingredients_attribute["name"])
        self.recipe_details.build(recipe: self, ingredient: ingredient, instruction: ingredients_attribute["recipe_details"]["instruction"])
       end 
    end 
  end 

  

  
end 
