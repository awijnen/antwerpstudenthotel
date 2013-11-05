class ReservationType < ActiveRecord::Base
  has_many :reservations
  belongs_to :room_type
  validates :room_type_id, presence: true
end
