FactoryBot.define do
  factory :item do
    name  { Faker::Food.dish }
    category { Faker::Restaurant.type }
    sequence(:price) { |n| n * 11.00 }
    image { "https://cdn.imgbin.com/6/25/4/imgbin-ramen-chinese-cuisine-instant-noodle-cafe-ramen-ZNpT2ydDk6mZj0KrMKmjreJka.jpg" }
    restaurant_id { Faker::Crypto.md5 }
  end
end
