class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :recruits, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :recruit_comments, dependent: :destroy
  has_many :customer_rooms
  has_many :messages
end
