require 'rails_helper'

describe 'Welcome Page' do
  describe 'As a visitor' do
    it 'I see the welcome page with popular search terms' do
      visit root_path

      expect(page).to have_content('Most Popular')
      expect(page).to have_link('Sign In')
      expect(page).to have_button('Search')
      expect(page).to have_button('Browse More')
    end
  end
end
