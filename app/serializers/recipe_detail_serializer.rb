class RecipeDetailSerializer < ActiveModel::Serializer

  attributes :id, :instruction

  has_many :ingredients
  has_many :recipes

end
