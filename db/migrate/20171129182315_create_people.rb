class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :secret
      t.string :country
      t.string :email
      t.text :description
      t.boolean :can_send_email
      t.integer :graduation_year
      t.float :body_temperature
      t.decimal :price
      t.date :birthday
      t.time :favorite_time
      t.string :extension

      t.timestamps
    end
  end
end
