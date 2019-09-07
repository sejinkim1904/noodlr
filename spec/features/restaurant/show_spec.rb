require 'rails_helper'

describe 'Restaurant show page' do
  describe "When I visit" do
    before :each do
      @restaurant = create(:restaurant)
    end

    it "As a visitor" do
      visit restaurant_path(@item)

      expect(page).to have_content(@item.name)
      expect(page).to have_content("Price: #{number_to_currency(@item.price)}")
      expect(page).to have_content("Category: #{@item.category}")
      expect(page).to have_content("Available at: #{@item.restaurant}")
      expect(page).to have_link("#{@item.restaurant}")
      expect(page).to have_css("img[src*='https://cdn.imgbin.com/6/25/4/imgbin-ramen-chinese-cuisine-instant-noodle-cafe-ramen-ZNpT2ydDk6mZj0KrMKmjreJka.jpg']")
    end
  end
end
