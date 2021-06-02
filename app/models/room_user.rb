class RoomUser < ApplicationRecord
  with_options presence: true do
    validates :room
    validates :user
  end
  
  belongs_to :room
  belongs_to :user
end
