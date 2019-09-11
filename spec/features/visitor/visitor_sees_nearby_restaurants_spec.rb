require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit the root page" do
    before(:all) do
      Geocoder.configure(lookup: :test, ip_lookup: :test)

      Geocoder::Lookup::Test.set_default_stub(
        [
          {
            'coordinates'  => [39.7063483,-104.9783864],
            'address'      => 'Denver, CO, USA',
            'state'        => 'Colorado',
            'state_code'   => 'CO',
            'country'      => 'United States',
            'country_code' => 'US'
          }
        ]
      )
      @uncle = Restaurant.create!(name: 'Uncle', latitude: 39.7148252, longitude: -104.9817735)
      @ototo = Restaurant.create!(name: 'OTOTO', latitude: 39.6892651, longitude: -104.980706)
      @nowhere = Restaurant.create!(name: 'Nowhere Ramen', latitude: 29.6892651, longitude: -104.980706)
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
