class Recipe < ApplicationRecord
  validates :name, :level, :serve, presence: true 
  belongs_to :chapter, optional: true

  has_many :directions, inverse_of: :recipe
  has_many :ingredients, inverse_of: :recipe
  belongs_to :user 
  
  has_many :reviews 
  has_one_attached :image

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true

  # scope :search, -> { where('name LIKE ?', "%#{keyword}%") }

  def self.search(keyword)
    if keyword
      where('name LIKE ?', "%#{keyword}%").order('id DESC')
    else
      all
    end
  end

  def thumbnail
    return self.image.variant(resize: '250x250')
  end

  def large
    return self.image.variant(resize: '500x400')
  end 


  # def ingredients_attributes=(ingredients_attributes)
  #   ingredients_attributes.values.each do |ingredients_attribute|
  #      if !ingredients_attribute["name"].empty?
  #       ingredient = Ingredient.find_or_create_by(name: ingredients_attribute["name"])
  #       self.recipe_details.build(recipe: self, ingredient: ingredient, instruction: ingredients_attribute["recipe_details"]["instruction"])
  #      end 
  #   end 
  # end 

  
end 
