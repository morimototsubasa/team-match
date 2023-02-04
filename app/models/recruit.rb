class Recruit < ApplicationRecord
  has_many :genre
  belongs_to :customer
end
