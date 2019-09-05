require 'rails_helper'

describe 'vister can create an account' do
  it 'visits the home page' do
    visit '/'
    click_on 'Sign In'
    email = 'jimbob@aol.com'
    first_name = 'Jim'
    last_name = 'Bob'
    password = 'password'

    expect(current_path).to eq(login_path)

    click_on 'Sign Up'
    fill_in 'user[email]', with: email
    fill_in 'user[first_name]', with: first_name
    fill_in 'user[last_name]', with: last_name
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on 'Create Account'

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content(email)
    expect(page).to have_content(first_name)
    expect(page).to have_content(last_name)
    expect(page).to_not have_content('Sign In')
		expect(page).to have_content("Logged in as #{first_name} #{last_name}")
		expect(page).to have_content("This account has not yet been activated. Please check your email or re-send email.")

    click_on "Log Out"

    visit new_user_path

    fill_in 'user[email]', with: email
    fill_in 'user[first_name]', with: first_name
    fill_in 'user[last_name]', with: last_name
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on 'Create Account'

    expect(page).to have_content('That email has already been taken.')
  end
end
