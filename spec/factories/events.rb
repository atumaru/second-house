FactoryBot.define do
  factory :event do
    title {"タイトル"}
    content {"テキスト"}
    start_time{"2021-02-16 16:29:00"}
    prefecture_id {3}
    association :user
   
  end
end
