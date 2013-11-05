class RoomType < ActiveRecord::Base
  has_many :reservation_types, dependent: :destroy
end
