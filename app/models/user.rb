class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  #validates_format_of :password, with: PASSWORD_REGEX

  validates :nickname, presence: true, length: { maximum: 30 }

  has_many :chats
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
end