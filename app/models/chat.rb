class Chat < ApplicationRecord
  with_options presence: true do
    validates :content
    validates :user
  end
  belongs_to :user
end
