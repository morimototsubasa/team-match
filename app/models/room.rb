class Room < ApplicationRecord
  has_many :customer_rooms
  has_many :messages
end
