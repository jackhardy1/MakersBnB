def enter_details_and_sign_up
  visit '/sign-up'
  fill_in :firstname, with: 'Matthew'
  fill_in :lastname, with: 'Ward'
  fill_in :email, with: 'matthew@theinternet.com'
  fill_in :password, with: 'password123'
  click_button 'Submit'
end

def log_in
  visit '/sign-in'
  fill_in :email, with: 'matthew@theinternet.com'
  fill_in :password, with: 'password123'
  click_button 'Log in'
end

def incorrect_email
  visit '/sign-up'
  fill_in :firstname, with: 'Matthew'
  fill_in :lastname, with: 'Ward'
  fill_in :email, with: 'matthew.theinternet.com'
  fill_in :password, with: 'password123'
  click_button 'Submit'
end
