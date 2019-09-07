require 'rails_helper'

describe 'Restaurant show page' do
  describe "When I visit" do
    before :each do
      @restaurant = create(:restaurant)
      @ramen = @restaurant.items.create!(name: "Tonkotsu", price: 1400, category: "ramen", image: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg")
      @ramen.reviews.create!(title: 'So tasteful!', body: 'This is the tastiest Tonkotsu in town', rating: 5)
      @ramen.reviews.create!(title: 'So tasteful!', body: 'This is the tastiest Tonkotsu in town', rating: 3)
    end

    it "As a visitor" do
      visit restaurant_path(@restaurant)

      expect(page).to have_content(@restaurant.name)
      expect(page).to have_content("Dishes")

      expect(page).to have_css('.items')
      expect(page).to have_css('.item', count: 1)

      expect(page).to have_content("Tonkotsu")
      expect(page).to have_content("Average Rating: 4.0")
    end
  end
end
