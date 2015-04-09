require 'capybara/rspec'

feature 'signing up' do
  scenario 'clicking sign up button' do
    visit('/')
    expect page.should have_content('Sign Up')
    find_button('Sign Up').click
    page.has_xpath('/signup')
  end
end
