class Reservation < ActiveRecord::Base
  belongs_to :reservation_type
  validates :reservation_type_id, presence: true
end
