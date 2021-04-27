FactoryBot.define do
  factory :goal do
    array = [1, 2]

    id { Faker::Number.number(digits: 2) }
    name { "say hello" }
    deadline { Faker::Number.number(digits: 2) }
    why { "To enter #{Faker::University.name}" }
    priority { Faker::Number.number(digits: 2) }
    category_id { array.sample }
    reachability { Faker::Number.number(digits: 2) }
    every_day_task { "read book" }

    user
  end
end
