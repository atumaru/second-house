FactoryBot.define do
  factory :tweet do
    title { 'こんにちは' }
    text { '今週は予定がありませんでした' }
    prefecture_id { 4 }

    association :user

    after(:build) do |tweet|
      tweet.image.attach(io: File.open('app/assets/images/my.jpg'), filename: 'my.jpg')
    end
  end
end
