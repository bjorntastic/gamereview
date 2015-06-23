class CreateGameVotes < ActiveRecord::Migration
  def change
    create_table :game_votes do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :value

      t.timestamps null: false
    end
  end
end
