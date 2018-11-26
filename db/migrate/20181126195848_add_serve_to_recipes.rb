class AddServeToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :serve, :string
  end
end
