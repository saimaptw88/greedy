FactoryBot.define do
  factory :user do
    id { Faker::Number.number(digits: 2) }
    email { Faker::Internet.email }
    password { "123456" }
  end
end
