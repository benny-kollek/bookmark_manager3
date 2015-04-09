require 'capybara/rspec'
require 'user'
require_relative 'user_management_helpers'

feature 'signing up' do
  include User_Management_Helpers
  scenario 'clicking sign up button' do
    visit('/')
    find_button('Sign Up').click
    expect(current_path).to eq('/signup')
  end

  scenario 'signing up' do
    expect(User.count).to eq 0
    visit('/signup')
    sign_up
    expect(User.count).to eq 1
    expect(current_path).to eq('/links')
    expect(page).to have_content('Welcome, ' + User.first.email)
  end
end
