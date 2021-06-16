FactoryBot.define do
  factory :chat do
    content  {Faker::Lorem.sentence}
    association :user
  end
end
