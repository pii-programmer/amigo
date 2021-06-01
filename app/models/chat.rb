class Chat < ApplicationRecord
  with_options presence: true do
    validates :content
    validates :user
  end
  has_many :users
end
