require 'rails_helper'

describe 'Restaurant show page' do
  describe "When I visit" do
    before :each do
      @restaurant = create(:restaurant)
      @ramen = @restaurant.items.create!(name: "Tonkotsu", price: 1400, category: "ramen", image: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg")
    end

    it "As a visitor" do
      visit restaurant_path(@restaurant)

      expect(page).to have_content(@restaurant.name)
      expect(page).to have_content("Dishes")

      expect(page).to have_css('.items')
      expect(page).to have_css('.item', count: @restaurant.items.length)
    end
  end
end
