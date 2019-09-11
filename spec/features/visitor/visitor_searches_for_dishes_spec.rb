require 'rails_helper'

describe "As a visitor" do
  describe "When i visit '/'" do
    describe "And I enter a dish name and click 'search'", search: true do
      before(:each) do
        @rest_1 = create(:restaurant)
        @rest_2 = create(:restaurant)
        @dish_1 = create(:item, status: 'verified', name: "Tonkotsu", restaurant: @rest_1)
        @dish_2 = create(:item, status: 'verified', name: "Miso", restaurant: @rest_1)
        @dish_3 = create(:item, status: 'verified', name: "Shoyu", restaurant: @rest_1)
        @dish_4 = create(:item, status: 'verified', name: "Tonkotsu", restaurant: @rest_2)
        @dish_5 = create(:item, status: 'verified', name: "Miso", restaurant: @rest_2)
        @dish_6 = create(:item, status: 'verified', name: "Shoyu", restaurant: @rest_2)
      end

      it "Gets a list of dishes with the matching names" do
        visit root_path

        fill_in :query, with: "tonkotsu"
        click_button 'Search'

        Item.search_index.refresh

        expect(Item.search("tonkotsu").map(&:name)).to eq(["Tonkotsu", "Tonkotsu"])
      end
    end
  end
end
