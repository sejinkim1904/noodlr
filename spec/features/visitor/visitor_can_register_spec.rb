require 'rails_helper'

describe 'vister can create an account' do
  it 'visits the home page' do
    visit '/'
    click_on 'Sign In'
    email = 'jimbob@aol.com'
    password = 'password'

    expect(current_path).to eq(login_path)

    click_on 'Sign Up'
    fill_in 'email[email]', with: email
    fill_in 'email[password]', with: password
    fill_in 'email[password_confirmation]', with: password

    click_on 'Create Account'

    expect(page).to have_content("Logged in as #{email}")
    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content(email)
    expect(page).to_not have_content('Sign In')
		expect(page).to have_content("This account has not yet been activated. Please check your email or re-send email.")

    click_on "Log Out"

    visit new_email_path

    fill_in 'email[email]', with: email
    fill_in 'email[password]', with: password
    fill_in 'email[password_confirmation]', with: password

    click_on 'Create Account'

    expect(page).to have_content('That email has already been taken.')
  end
end
