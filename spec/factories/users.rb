FactoryBot.define do
  factory :user do
    email  { Faker::Internet.email }
    first_name { Faker::Artist.name }
    last_name { Faker::Artist.name }
    password { Faker::Color.color_name }
    registered { "12ad3" }
    role { :default }
  end

  factory :admin, parent: :user do
    role { :admin }
  end
end
