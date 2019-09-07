require 'rails_helper'

describe 'Restaurant show page' do
  describe "When I visit" do
    before :each do
      @restaurant = create(:restaurant)
    end

    it "As a visitor" do
      visit restaurant_path(@restaurant)

      expect(page).to have_content(@restaurant.name)
    end
  end
end
