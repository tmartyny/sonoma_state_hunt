class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :clue
      t.string :video_id
      t.string :photo_url
      t.float :lat
      t.float :lon
      t.string :name
      t.integer :points
      t.string :direction

      t.timestamps null: false
    end
  end
end
