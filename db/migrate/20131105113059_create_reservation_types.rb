class CreateReservationTypes < ActiveRecord::Migration
  def change
    create_table :reservation_types do |t|
      t.integer :room_type_id
      t.string :length_type
      t.date :start_date
      t.date :end_date
      t.integer :price
      t.integer :quantity
      t.integer :available
      t.string :marketing_msg
      t.string :marketing_color
      t.boolean :sold_out

      t.timestamps
    end
  end
end
