FactoryBot.define do
  factory :restaurant do
    latitude { 39.7148252 }
    longitude { -131.681037138249 }
    name  { Faker::Food.dish }
    rating { rand(1..5) }
    address_1 { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip_code { Faker::Address.zip_code }
    phone { Faker::PhoneNumber.cell_phone }
    yelp_id { Faker::Alphanumeric.alphanumeric(number: 10) }
  end
end
