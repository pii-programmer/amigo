class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 30 }

  has_many :chats
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages

  has_one_attached :avatar
end