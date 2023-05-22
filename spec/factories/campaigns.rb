FactoryBot.define do
  factory :campaign do
    name { "Campaign #{Faker::Number.number(digits: 2)}" }
  end
end
