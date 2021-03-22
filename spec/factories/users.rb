FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name {"田中"}
    first_name {"太郎"}
    family_name_kana {"タナカ"}
    first_name_kana {"タロウ"}
    birth_day {Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today)}
  end
end
