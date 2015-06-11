class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :rating
      t.string :title
      t.text :comment

      t.timestamps null: false
    end
  end
end
