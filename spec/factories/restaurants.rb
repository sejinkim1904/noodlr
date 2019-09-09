FactoryBot.define do
  factory :restaurant do
    latitude { "9.99" }
    longitude { "9.99" }
    name  { Faker::Food.dish }
  end
end
