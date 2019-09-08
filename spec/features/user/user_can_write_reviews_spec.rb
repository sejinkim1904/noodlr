require 'rails_helper'

describe 'Restaurant show page' do
  describe "When I visit" do
    before :each do
      @restaurant = create(:restaurant)
      @ramen = @restaurant.items.create!(name: "Tonkotsu", price: 1400, category: "ramen", image: "https://s3-media2.fl.yelpcdn.com/bphoto/eMmvwCMQtOUs7GxccJu4zA/o.jpg")
    end

    it "As a registered user" do
      user = create(:user)
      user.update_attributes(registered: 'true')
      visit '/'
      click_on "Sign In"
      fill_in 'session[email]', with: user.email
      fill_in 'session[password]', with: user.password
      click_on 'Log In'

      visit restaurant_path(@restaurant)

      within ('#Tonkotsu') do
        expect(page).to have_content("Tonkotsu")
        expect(page).to have_content("Average Rating: 0.0")
        click_on "Write a Review"
      end
      
      # @ramen.reviews.create!(title: 'So tasteful!', body: 'This is the tastiest Tonkotsu in town', rating: 5)
    end
  end
end
