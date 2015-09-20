class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :provider
      t.string :uid
      t.boolean :admin,  default: false
      t.boolean :current_student, default: false

      t.timestamps null: false
    end
  end
end
