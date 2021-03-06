FactoryBot.define do
  factory :message do
    content { 'こんにちは' }
    association :user
    association :room
  end
end
