FactoryBot.define do
  factory :goal do
    deadline { Faker::Date.forward }
    why { "To enter #{Faker::University.name}" }

    user
  end
end
