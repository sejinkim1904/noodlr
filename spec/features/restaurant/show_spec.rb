require 'rails_helper'

describe 'Restaurant show page' do
  describe "When I visit" do
    before :each do
      @reviwer = create(:user)
      @user = create(:user)
      @restaurant = create(:restaurant)
      @ramen = @restaurant.items.create!(name: "Tonkotsu", price: 14, category: "ramen", image: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg", status: 'verified')
      @ramen.reviews.create!(user: @reviwer, title: 'So tasteful!', body: 'This is the tastiest Tonkotsu in town', rating: 5)
      @ramen.reviews.create!(user: @reviwer, title: 'So tasteful!', body: 'This is the tastiest Tonkotsu in town', rating: 3)
    end

    it "As a visitor" do
      visit restaurant_path(@restaurant)

      expect(page).to have_content(@restaurant.name)
      expect(page).to have_content("Dishes")

      expect(page).to have_css('.items')
      expect(page).to have_css('.item', count: 1)

      within ('#Tonkotsu') do
        expect(page).to have_content("Tonkotsu")
        expect(page).to have_content("Average Rating: 4.0")
      end

      expect(page).to_not have_content("Write a Review")
    end

    it "As a registered user" do
      @user.update_attributes(registered: 'true')
      visit '/'
      click_on "Sign In"
      fill_in 'session[email]', with: @user.email
      fill_in 'session[password]', with: @user.password
      click_on 'Log In'

      visit restaurant_path(@restaurant)

      expect(page).to have_content(@restaurant.name)
      expect(page).to have_content("Dishes")

      expect(page).to have_css('.items')
      expect(page).to have_css('.item', count: 1)

      within ('#Tonkotsu') do
        expect(page).to have_content("Tonkotsu")
        expect(page).to have_content("Average Rating: 4.0")
        expect(page).to have_link("Write a Review")
      end
    end

    it "As an admin" do
      admin = create(:admin)
      visit '/'
      click_on "Sign In"
      fill_in 'session[email]', with: admin.email
      fill_in 'session[password]', with: admin.password
      click_on 'Log In'

      visit restaurant_path(@restaurant)

      expect(page).to have_content(@restaurant.name)
      expect(page).to have_content("Dishes")

      expect(page).to have_css('.items')
      expect(page).to have_css('.item', count: 1)

      within ('#Tonkotsu') do
        expect(page).to have_content("Tonkotsu")
        expect(page).to have_content("Average Rating: 4.0")
        expect(page).to_not have_link("Write a Review")
      end
    end

    it "As an unregistered user" do
      visit '/'
      click_on "Sign In"
      fill_in 'session[email]', with: @user.email
      fill_in 'session[password]', with: @user.password
      click_on 'Log In'

      visit restaurant_path(@restaurant)

      expect(page).to have_content(@restaurant.name)
      expect(page).to have_content("Dishes")

      expect(page).to have_css('.items')
      expect(page).to have_css('.item', count: 1)

      within ('#Tonkotsu') do
        expect(page).to have_content("Tonkotsu")
        expect(page).to have_content("Average Rating: 4.0")
        expect(page).to_not have_link("Write a Review")
      end
    end
  end
end
