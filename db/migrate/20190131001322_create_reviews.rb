class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :content 
      t.integer :user_id
      t.integer :recipe_id 
      t.string :review_owner
      t.timestamps
    end
  end
end
