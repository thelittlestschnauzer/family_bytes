class RecipeDetail < ApplicationRecord
  belongs_to :recipe, optional: true 
  belongs_to :ingredient, optional: true

  validates :instruction, presence: true 

end
