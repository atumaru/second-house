FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {"999aaa"}
    password_confirmation {password}
    first_name            {"太郎"}
    last_name             {"山田"}
    prefecture_id            {3}
    prefecture_now_id        {3}
  end
end