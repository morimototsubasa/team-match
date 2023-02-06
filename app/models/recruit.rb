class Recruit < ApplicationRecord
  has_many :genres
  belongs_to :customer
end
