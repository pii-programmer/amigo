class Chat < ApplicationRecord
  validates :user, presence: true
  validates :content, presence: true
  belongs_to :user
end
