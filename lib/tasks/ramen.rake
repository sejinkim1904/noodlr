namespace :ramen do
  task denver: :environment do
    yelp = YelpService.new
    restaurants = yelp.restaurants("ramen", "Denver, CO")

    restaurants[:businesses].map do |attr|
      Restaurant.create(
        name: attr[:name],
        yelp_id: attr[:id],
        rating: attr[:rating],
        latitude: attr[:coordinates][:latitude],
        longitude: attr[:coordinates][:longitude],
        address_1: attr[:location][:address1],
        address_2: attr[:location][:address2],
        city: attr[:location][:city],
        state: attr[:location][:state],
        zip_code: attr[:location][:zip_code],
        phone: attr[:display_phone]
      )
    end
  end
end
