FactoryBot.define do
  factory :comment do
    text{"こんにちは"}
    association :user
    association :tweet
  end
end
