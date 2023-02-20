class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && (is_customer_status == false)
  end
  # 退会しているユーザーは同じアカウントでログインできない

  has_many :recruits, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :recruit_comments, dependent: :destroy
  has_many :customer_rooms
  has_many :messages
  
  validates :name, presence: true
  validates :name_kana, presence: true
  validates :phone_number, presence: true
  validates :school_name, presence: true
  validates :email, presence: true
end
