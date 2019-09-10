require 'rails_helper'

describe 'User' do
  before :each do
    visit root_path
    click_on 'Sign In'
    @email = 'jimbob@aol.com'
    @password = 'password'
    click_on 'Sign Up'
    fill_in 'email[email]', with: @email
    fill_in 'email[password]', with: @password
    fill_in 'email[password_confirmation]', with: @password

    click_on 'Create Account'
    click_on 'Log Out'
    visit root_path
  end

  it 'user can sign in' do
    click_on "Sign In"

    expect(current_path).to eq(login_path)

    fill_in 'session[email]', with: @email
    fill_in 'session[password]', with: @password

    click_on 'Log In'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content(@email)
		expect(page).to have_content("Logged in as #{@email}")
  end

  it 'can log out' do
    click_on "Sign In"

    fill_in 'session[email]', with: @email
    fill_in 'session[password]', with: @password

    click_on 'Log In'

    click_on 'Log Out'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Sign In')
  end

  it 'is shown an error when incorrect info is entered' do
    click_on "Sign In"

    fill_in 'session[email]', with: "email@email.com"
    fill_in 'session[password]', with: "123"

    click_on 'Log In'

    expect(page).to have_content("Your email or password is invalid")
  end
end
