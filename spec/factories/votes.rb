FactoryBot.define do
  factory :vote do
    campaign
    voted_at { Time.now }
    choice { "Choice #{Faker::Number.number(digits: 2)}" }
    validity { ['during', 'pre', 'post'].sample }
  end
end
