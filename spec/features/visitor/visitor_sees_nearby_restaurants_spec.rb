require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit the root page" do
    before(:all) do
      @uncle = create(:restaurant, name: 'Uncle', latitude: 39.7148252, longitude: -104.9817735)
      @ototo = create(:restaurant, name: 'OTOTO', latitude: 39.6892651, longitude: -104.980706)
      @nowhere = create(:restaurant, name: 'Nowhere Ramen', latitude: 29.6892651, longitude: -104.980706)
    end
    it "only restaurants nearby are returned to me" do
      visit root_path
      within '#nearby' do
        expect(page).to have_content(@uncle.name)
        expect(page).to have_content(@ototo.name)
        expect(page).to_not have_content(@nowhere.name)
      end
    end

  end
end
