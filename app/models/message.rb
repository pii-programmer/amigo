class Message < ApplicationRecord
  with_options presence: true do
    validates :content
    validates :room
    validates :user
  end
  
  belongs_to :room
  belongs_to :user
end
