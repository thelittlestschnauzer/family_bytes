class CreateDirections < ActiveRecord::Migration[5.2]
  def change
    create_table :directions do |t|
      t.string :method 
      t.integer :recipe_id
      
      t.timestamps
    end
  end
end
