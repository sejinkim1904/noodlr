require 'rails_helper'
WebMock.allow_net_connect!

describe 'Welcome Page' do
  describe 'As a visitor', :js do
    it 'I see the embedded Google Map for a restaurant' do
      restaurant = FactoryBot.create(:restaurant)
      visit restaurant_path(restaurant)

      expect(page).to have_css('div#map')
      expect(page).to have_content(restaurant.name)
    end
  end
end
