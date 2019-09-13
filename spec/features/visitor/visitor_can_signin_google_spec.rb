require 'rails_helper'

describe 'As a vistior' do
  describe 'When I visit the login page' do
    it "I can login with google" do
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
      visit login_path
      click_button 'Google'
      expect(current_path).to eq(root_path)

      expect(page).to have_content('Signed in with Google!')
      visit dashboard_path
      expect(page).to have_content('manilda7')
    end
  end
end
