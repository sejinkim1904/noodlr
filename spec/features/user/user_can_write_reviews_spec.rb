require 'rails_helper'

describe 'Restaurant show page' do
  describe "When I visit" do
    before :each do
      @restaurant = create(:restaurant)
      owner = @restaurant.users.create!(role: 'restaurant', registered: 'true')
      owner.emails.create!(email: 'owner@owner.com', password_digest: 'abc123')
      @ramen = @restaurant.items.create!(name: "Tonkotsu", price: 14.00, category: "ramen", image: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg", status: 'verified')
      @user = User.create!(registered: 'true')
      email = @user.emails.create!(email: 'r@r.r', password: 'password')
      visit '/'
      click_on "Sign In"
      fill_in 'session[email]', with: email.email
      fill_in 'session[password]', with: email.password
      click_on 'Log In'
    end

    it "A registered user can review an item" do
      visit restaurant_path(@restaurant)

      within ('#Tonkotsu') do
        expect(page).to have_content("Tonkotsu")
        expect(page).to have_content("Average Rating: 0.0")
        click_on "Write a Review"
      end

      expect(current_path).to eq(new_default_item_review_path(@ramen))
      expect(page).to have_content("Review for Tonkotsu")

      fill_in 'review[title]', with: 'So tasteful!'
      fill_in 'review[body]', with: 'This is the tastiest Tonkotsu in town'
      select "5", :from => "review[rating]"

      click_on "Submit"

      expect(page).to have_content("Review created.")
      expect(current_path).to eq(item_path(@ramen))

      visit restaurant_path(@restaurant)

      within ('#Tonkotsu') do
        expect(page).to have_content("Tonkotsu")
        expect(page).to have_content("Average Rating: 5.0")
        expect(page).to_not have_content("Write a Review")
      end
    end

    it "A registered user cannot write a bad review" do
      visit restaurant_path(@restaurant)

      within ('#Tonkotsu') do
        expect(page).to have_content("Tonkotsu")
        expect(page).to have_content("Average Rating: 0.0")
        click_on "Write a Review"
      end

      expect(current_path).to eq(new_default_item_review_path(@ramen))
      expect(page).to have_content("Review for Tonkotsu")

      fill_in 'review[title]', with: 'So tasteful!'
      select "5", :from => "review[rating]"

      click_on "Submit"

      expect(page).to have_content('Review could not be saved.')
      expect(current_path).to eq(new_default_item_review_path(@ramen))
    end

    it 'An unregistered user cannot leave a review' do
      @user.update_attributes(registered: 'false')

      visit new_default_item_review_path(@ramen)

      expect(current_path).to eq(dashboard_path)

      page.driver.submit :post, default_item_reviews_path(@ramen), {}

      expect(current_path).to eq(dashboard_path)
    end

    it "A registered user can suggest a new item to review" do
      visit restaurant_path(@restaurant)

      expect(page).to have_content("Average Rating: 0.0")

      click_on "Review a New Item"

      expect(page).to have_content("Review a New Item")
      expect(current_path).to eq(new_default_restaurant_item_path(@restaurant))

      fill_in 'item[name]', with: 'Shoyu'
      fill_in 'item[price]', with: 14.00
      fill_in 'item[category]', with: 'ramen'
      fill_in 'item[image]', with: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg"

      fill_in 'item[review][title]', with: 'So tasteful!'
      fill_in 'item[review][body]', with: 'This is the tastiest Shoyu in town'
      select "5", :from => "item[review][rating]"

      click_on "Submit"

      expect(page).to have_content("Item has been suggested to restaurant owner for approval.")
      expect(current_path).to eq(restaurant_path(@restaurant))

      visit restaurant_path(@restaurant)

      within ('#Shoyu') do
        expect(page).to have_content("Shoyu")
        expect(page).to have_content("Average Rating: 5.0")
        expect(page).to_not have_content("Write a Review")
      end

      page.driver.submit :post, default_item_reviews_path(Item.last), {review: {title: 'Shoyu'}}

      expect(page).to have_content('Review could not be saved.')
    end

    it "A registered user cannot suggest a bad item for review" do
      visit restaurant_path(@restaurant)

      expect(page).to have_content("Average Rating: 0.0")

      click_on "Review a New Item"

      expect(page).to have_content("Review a New Item")
      expect(current_path).to eq(new_default_restaurant_item_path(@restaurant))

      fill_in 'item[name]', with: 'Shoyu'
      fill_in 'item[price]', with: -1400
      fill_in 'item[category]', with: 'ramen'
      fill_in 'item[image]', with: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg"

      fill_in 'item[review][title]', with: 'So tasteful!'
      fill_in 'item[review][body]', with: 'This is the tastiest Shoyu in town'
      select "5", :from => "item[review][rating]"

      click_on "Submit"

      expect(page).to have_content("Item could not be saved.")
      expect(current_path).to eq(new_default_restaurant_item_path(@restaurant))

      visit restaurant_path(@restaurant)

      expect(page).to_not have_content("Shoyu")
    end
  end
end
