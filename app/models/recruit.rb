class Recruit < ApplicationRecord
  belongs_to :genre
  belongs_to :city
  belongs_to :customer
  has_many :favorites, dependent: :destroy
end