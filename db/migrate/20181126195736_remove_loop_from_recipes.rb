class RemoveLoopFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :loop, :string
  end
end
