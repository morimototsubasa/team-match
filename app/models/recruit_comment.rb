class RecruitComment < ApplicationRecord
  belongs_to :customer
  belongs_to :recruit
  validates :comment, presence: true
end
