class RemoveIngredientsFromSearches < ActiveRecord::Migration[5.2]
  def change
    remove_column :searches, :ingredients
  end
end
