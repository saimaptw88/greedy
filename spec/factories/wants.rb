FactoryBot.define do
  factory :want do
    # array = [1, 2]
    array = [1]
    sequence(:id) {|i| i - 1 }
    name { "To create #{Faker::App.name}" }
    category_id { array.sample }
    sequence(:priority) {|i| i - 1 }
    reachability { Faker::Number.decimal_part(digits: 2) }

    user
  end
end
