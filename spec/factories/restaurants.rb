FactoryBot.define do
  factory :restaurant do
    name  { Faker::Food.dish }
  end
end
