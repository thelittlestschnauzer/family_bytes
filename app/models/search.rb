class Search < ApplicationRecord

  #can this be turned into a scope instead
  # def search_recipes 
  #   recipes = Recipe.all 
  #   recipes = recipes.where(["name LIKE ?", "%#{keyword}%"]) if keyword.present?
  #   return recipes 
  # end 

  # scope :search_recipes, -> { where("name LIKE ?", "%#{keyword}%") } if keyword.present?
    
end 
