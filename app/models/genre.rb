class Genre < ApplicationRecord
  # belongs_to :recruit
  has_many :recruits
end
