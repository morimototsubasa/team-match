class Recruit < ApplicationRecord
  belongs_to :genre
  belongs_to :city
  belongs_to :customer
  has_many :favorites, dependent: :destroy
  has_many :recruit_comments, dependent: :destroy
  
  def favorited_by?(custoemr)
    favorites.exists?(customer_id: customer.id)
  end
end