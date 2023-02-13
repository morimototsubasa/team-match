class CustomerRoom < ApplicationRecord
  belongs_to :room
  belongs_to :customer
end
