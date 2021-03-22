FactoryBot.define do
  factory :want do
    target { "To create #{Faker::App.name}" }
    priority { Faker::Number.decimal_part(digits: 1) }
    reachability { "#{Faker::Number.decimal_part(digits: 2)}%" }

    user
  end
end
