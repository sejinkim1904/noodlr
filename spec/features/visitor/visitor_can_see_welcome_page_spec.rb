require 'rails_helper'

describe 'Welcome Page' do
  describe 'As a visitor' do
    describe 'When I visit "/" I see the welcome page with most popular search terms' do
      it "I also see a 'Browse more' button" do
        visit "/"

        expect(page).to have_content('Most Popular')
        save_and_open_page
        expect(page).to have_button('Login')
        expect(page).to have_button('Search')
        expect(page).to have_button('Browse More')
      end
    end
  end
end
