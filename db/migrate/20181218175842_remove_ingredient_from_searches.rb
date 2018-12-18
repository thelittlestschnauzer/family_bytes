class RemoveIngredientFromSearches < ActiveRecord::Migration[5.2]
  def change
    remove_column :searches, :ingredient
  end
end
