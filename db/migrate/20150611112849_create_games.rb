class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :platform
      t.string :genre
      t.string :publisher

      t.timestamps null: false
    end
  end
end
