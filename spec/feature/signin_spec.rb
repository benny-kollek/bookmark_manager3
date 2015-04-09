require 'capybara/rspec'
require 'user'
require_relative 'user_management_helpers'

feature 'Log in' do
  include User_Management_Helpers
  before :each do
    User.create(email: 'a@a.com', password: 'baseball')
  end

  scenario 'clicking log in button' do
    visit('/')
    find_button('Log In').click
    expect(current_path).to eq('/signin')
  end

  scenario 'logging in' do
    sign_up
    sign_in
    expect(current_path).to eq('/links')
    expect(page).to have_content('Welcome, ' + User.first.email)
  end

  xscenario 'raised error when signing in with acc that does not exist'
end
