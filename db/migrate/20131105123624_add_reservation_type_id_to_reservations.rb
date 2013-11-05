class AddReservationTypeIdToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :reservation_type_id, :integer
  end
end
