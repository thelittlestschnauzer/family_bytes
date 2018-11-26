class AddLevelToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :level, :string
  end
end
