FactoryBot.define do
  factory :user do
    registered { "12ad3" }
  end

  factory :admin, parent: :user do
    role { :admin }
  end
end
