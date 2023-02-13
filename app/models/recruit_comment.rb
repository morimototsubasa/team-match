class RecruitComment < ApplicationRecord
  belongs_to :customer
  belongs_to :recruit
end
