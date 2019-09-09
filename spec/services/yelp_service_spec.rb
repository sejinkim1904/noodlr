require 'rails_helper'

describe YelpService do
  context 'instance methods' do
    it "returns restaurant data" do
      json_response = File.open("./fixtures/restaurants.json")
      stub_request(:get, "https://api.yelp.com/v3/businesses/search?term=ramen&location=Denver, CO").
        to_return(status: 200, body: json_response)
      restaurants = subject.restaurants("ramen", "Denver, CO")

      expect(restaurants).to be_an Hash
      expect(restaurants.first).to be_a Array
      expect(restaurants[:businesses].count).to eq(20)

      restaurant_data = restaurants[:businesses][0]

      expect(restaurant_data).to have_key(:name)
      expect(restaurant_data).to have_key(:id)
      expect(restaurant_data).to have_key(:rating)
      expect(restaurant_data).to have_key(:coordinates)
      expect(restaurant_data).to have_key(:location)
      expect(restaurant_data).to have_key(:display_phone)
    end
  end
end
