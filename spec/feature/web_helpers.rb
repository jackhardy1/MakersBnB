def enter_details_and_sign_up
  visit '/sign-up'
  fill_in :firstname, with: 'Matthew'
  fill_in :lastname, with: 'Ward'
  fill_in :email, with: 'matthew@theinternet.com'
  fill_in :password, with: 'password123'
  click_button 'Submit'
end

def enter_details_and_sign_up_guest
  visit '/sign-up'
  fill_in :firstname, with: 'Jack'
  fill_in :lastname, with: 'hardy'
  fill_in :email, with: 'jack@jack.com'
  fill_in :password, with: 'password123'
  click_button 'Submit'
end

def log_in
  visit '/sign-in'
  fill_in :email, with: 'matthew@theinternet.com'
  fill_in :password, with: 'password123'
  click_button 'Log in'
end

def log_in_guest
  visit '/sign-in'
  fill_in :email, with: 'jack@jack.com'
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

def incorrect_password
  visit '/sign-in'
  fill_in :email, with: 'matthew@theinternet.com'
  fill_in :password, with: 'boop'
  click_button 'Log in'
end

def list_a_space
  click_button('list a space')
  fill_in :name, with: 'makers'
  fill_in :description, with: 'makers'
  fill_in :price, with: 10
  fill_in :start_date, with: '2017,05,18'
  fill_in :end_date, with: '2017,05,20'
  click_button 'add space'
end

def list_space_and_sign_in_as_different_user
  enter_details_and_sign_up
  click_button('View spaces')
  list_a_space
  click_button('Sign out')
  enter_details_and_sign_up_guest
  click_button('View spaces')
end

def request_to_book_space_and_view_requests
  enter_details_and_sign_up
  click_button('View spaces')
  click_button('view details')
  click_button('request to book')
  click_button('view requests')
end
