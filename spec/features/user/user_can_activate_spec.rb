require "rails_helper"

describe 'user can register an account' do
	it 'through email verification' do
		visit '/'
		click_on 'Sign In'
		click_on 'Sign Up'
		fill_in 'user[email]', with: 'jimbob@aol.com'
    fill_in 'user[first_name]', with: 'Jim'
    fill_in 'user[last_name]', with: 'Bob'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_on 'Create Account'

    expect(current_path).to eq(dashboard_path)

		page.driver.submit :get, activation_path(User.last.registered), {}

		expect(page).to have_content("Thank you! Your account is now activated.")

		expect(current_path).to eq(dashboard_path)
		expect(page).to have_content("Status: Active")

		page.driver.submit :get, activate_user_path("5"), {}

		expect(page).to have_content("User not found!")
	end
end
