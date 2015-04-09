require 'capybara/rspec'
require 'user'

feature 'signing up' do
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

  def sign_up email='a@a.com', password='baseball'
    visit '/signup'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign Up'
  end
end
