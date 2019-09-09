require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit an 'items/:id'" do
    before(:each) do
      restaurant = create(:restaurant)
      @item = create(:item, restaurant_id: restaurant.id, status: 'verified')
    end

    it "I see the item with that id including the item's\n
    -name\n
    -price\n
    -category\n
    -image\n
    -restaurant, which is a link to the restaurant's show page" do

      visit item_path(@item)

      expect(page).to have_content(@item.name)
      expect(page).to have_content("Price: #{number_to_currency(@item.price)}")
      expect(page).to have_content("Category: #{@item.category}")
      expect(page).to have_content("Available at: #{@item.restaurant.name}")
      expect(page).to have_link("#{@item.restaurant.name}")
      expect(page).to have_css("img[src*='https://cdn.imgbin.com/6/25/4/imgbin-ramen-chinese-cuisine-instant-noodle-cafe-ramen-ZNpT2ydDk6mZj0KrMKmjreJka.jpg']")

      click_on "#{@item.restaurant.name}"

      expect(current_path).to eq(restaurant_path(@item.restaurant))
    end
  end
end
