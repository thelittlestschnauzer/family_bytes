class AddIngredientToSearches < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :ingredient, :string
  end
end
