require 'rails_helper'

describe 'Welcome Page' do
  describe 'As a visitor' do
    it 'I see the embedded Google Map' do
      restaurant = FactoryBot.create(:restaurant)
      visit restaurant_path(restaurant)

      expect(page).to have_css('div#map')
      expect(page).to have_content(restaurant.name)
      expect(page).to have_content(restaurant.latitude)
      expect(page).to have_content(restaurant.longitude)
    end
  end
end
