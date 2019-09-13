require 'rails_helper'

describe 'Restaurant owner dashboard' do
  describe "When I visit" do
    before :each do
      @restaurant = create(:restaurant)
      @owner = User.create!(role: 'restaurant', registered: 'true', restaurant_id: @restaurant.id)
      @owner_email = @owner.emails.create!(email: 'owner@owner.com', password: 'abc123')
      @ramen = @restaurant.items.create!(name: "Tonkotsu", price: 14.00, category: "ramen", image: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg", status: 'verified')
      @user = User.create!(registered: 'true')
      email = @user.emails.create!(email: 'r@r.r', password: 'password')
      visit '/'
      click_on "Sign In"
      fill_in 'session[email]', with: email.email
      fill_in 'session[password]', with: email.password
      click_on 'Log In'
    end

    it "A registered user can suggest a new item to review" do
      visit restaurant_path(@restaurant)

      expect(page).to have_content("Average Rating: 0.0")

      click_on "Review a New Item"
      expect(page).to have_content("Review a New Item")
      expect(current_path).to eq(new_default_restaurant_item_path(@restaurant))

      fill_in 'item[name]', with: 'Shoyu'
      fill_in 'item[price]', with: 14.00
      page.select('Ramen', from: 'Category')
      fill_in 'item[image]', with: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg"

      fill_in 'item[review][title]', with: 'So tasteful!'
      fill_in 'item[review][body]', with: 'This is the tastiest Shoyu in town'
      select "5", :from => "item[review][rating]"

      click_on "Submit"

      expect(page).to have_content("Item has been suggested to restaurant owner for approval.")
      expect(current_path).to eq(restaurant_path(@restaurant))

      visit restaurant_path(@restaurant)

      expect(page).to_not have_css('#Shoyu')

      click_on 'Log Out'
      click_on "Sign In"
      fill_in 'session[email]', with: @owner_email.email
      fill_in 'session[password]', with: @owner_email.password
      click_on 'Log In'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Pending Items")

      within ('#item-Shoyu') do
        expect(page).to have_content("Shoyu")
        expect(page).to have_content("$14.00")
        expect(page).to have_content("Ramen")
        expect(page).to have_content("Approve Item")

        click_on "Approve Item"
      end

      expect(page).to have_content('This item has been verified!')
    end
  end
end
