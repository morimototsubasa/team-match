class Recruit < ApplicationRecord
  belongs_to :genre
  belongs_to :city
  belongs_to :customer
  has_many :favorites, dependent: :destroy
  has_many :recruit_comments, dependent: :destroy
  
  validates :name, presence: true
  validates :school_name, presence: true
  validates :recruit_text, presence: true
  validates :genre_id, presence: true
  validates :city_id, presence: true
  
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end