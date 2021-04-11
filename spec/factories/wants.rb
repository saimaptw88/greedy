FactoryBot.define do
  factory :want do
    array = [1, 2]
    name { "To create #{Faker::App.name}" }
    sequence(:priority) {|i| i - 1 }
    reachability { Faker::Number.decimal_part(digits: 2) }
    category_id { array.sample }

    user
  end
end
