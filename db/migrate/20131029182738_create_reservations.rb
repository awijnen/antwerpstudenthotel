class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.string :name
      t.string :surname
      t.integer :age
      t.string :street
      t.integer :street_nr
      t.string :city
      t.integer :city_zip
      t.string :country
      t.string :email
      t.string :phone
      t.string :university
      t.text :comment
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
