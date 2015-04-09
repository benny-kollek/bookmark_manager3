require 'capybara/rspec'

feature 'signing up' do
  scenario 'clicking sign up button' do
    visit('/')
    find_button('Sign Up').click
    expect(current_path).to eq('/signup')
  end
end
