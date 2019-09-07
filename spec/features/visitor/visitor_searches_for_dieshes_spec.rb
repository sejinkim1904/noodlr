require 'rails_helper'


describe "As a visitor" do
  describe "When i visit '/'" do
    describe "And I enter a dish name and click 'search'" do
      before(:each) do
        @rest_1 = create(:restaurant)
        @rest_2 = create(:restaurant)
        @dish_1 = create(:item, name: "Tonkotsu", restaurant: @rest_1)
        @dish_2 = create(:item, name: "Miso", restaurant: @rest_1)
        @dish_3 = create(:item, name: "Shoyu", restaurant: @rest_1)
        @dish_4 = create(:item, name: "Tonkotsu", restaurant: @rest_2)
        @dish_5 = create(:item, name: "Miso", restaurant: @rest_2)
        @dish_6 = create(:item, name: "Shoyu", restaurant: @rest_2)
      end

      it "Gets a list of dishes with the matching names" do
        visit root_path

        fill_in :query, with: "Tonkotsu"
        click_button 'Search'

        expect(current_path).to eq(results_path)

        expect(page).to have_content("2 Results")

        within "#item-#{@dish_1.id}" do
          expect(page).to have_content(@dish_1.name)
          expect(page).to have_content("Price: #{@dish_1.price}")
          expect(page).to have_content("Available at: #{@rest_1.name}")
          expect(page).to have_link(@rest_1.name)
          expect(page).to have_css("img[src*='#{@dish_1.image}']")
        end

        within "#item-#{@dish_4.id}" do
          expect(page).to have_content(@dish_4.name)
          expect(page).to have_content("Price: #{@dish_4.price}")
          expect(page).to have_content("Available at: #{@rest_2.name}")
          expect(page).to have_link(@rest_2.name)
          expect(page).to have_css("img[src*='#{@dish_1.image}']")
        end
      end
    end
  end
end
