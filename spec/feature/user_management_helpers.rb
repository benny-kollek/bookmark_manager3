module User_Management_Helpers
  def sign_in email='a@b.com', password='baseball'
    visit '/signin'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Log In'
  end

  def sign_up email='a@a.com', password='baseball'
    visit '/signup'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign Up'
  end
end
