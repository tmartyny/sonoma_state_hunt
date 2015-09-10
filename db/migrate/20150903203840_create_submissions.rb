class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :challenge, index: true, foreign_key: true
      t.string :text
      t.string :photo
      t.float :lat
      t.float :lon

      t.timestamps null: false
    end
  end
end
