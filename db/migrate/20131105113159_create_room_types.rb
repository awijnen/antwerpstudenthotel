class CreateRoomTypes < ActiveRecord::Migration
  def change
    create_table :room_types do |t|
      t.text :description
      t.integer :rating
      t.boolean :shared_room
      t.integer :size
      t.boolean :furnished

      t.timestamps
    end
  end
end
