def enter_details_and_sign_up
  visit '/sign-up'
  fill_in :firstname, with: 'Matthew'
  fill_in :lastname, with: 'Ward'
  fill_in :email, with: 'iammatthewward@gmail.com'
  fill_in :password, with: 'password123'
  click_button 'Sign-up'
end

def enter_details_and_sign_up_guest
  visit '/sign-up'
  fill_in :firstname, with: 'Jack'
  fill_in :lastname, with: 'hardy'
  fill_in :email, with: 'jackhardy1@gmail.com'
  fill_in :password, with: 'password123'
  click_button 'Sign-up'
end

def log_in
  visit '/sign-in'
  fill_in :email, with: 'iammatthewward@gmail.com'
  fill_in :password, with: 'password123'
  click_button 'Sign in'
end

def log_in_guest
  visit '/sign-in'
  fill_in :email, with: 'jackhardy1@gmail.com'
  fill_in :password, with: 'password123'
  click_button 'Sign in'
end

def incorrect_email
  visit '/sign-up'
  fill_in :firstname, with: 'Matthew'
  fill_in :lastname, with: 'Ward'
  fill_in :email, with: 'iammattgmail.com'
  fill_in :password, with: 'password123'
  click_button 'Sign-up'
end

def incorrect_password
  visit '/sign-in'
  fill_in :email, with: 'iammatthewward@gmail.com'
  fill_in :password, with: 'boop'
  click_button 'Sign in'
end

def list_a_space
  click_button('List a space')
  fill_in :name, with: 'makers'
  fill_in :description, with: 'makers'
  fill_in :price, with: 10
  fill_in :start_date, with: '2017-05-18'
  fill_in :end_date, with: '2017-05-20'
  click_button 'Add space'
end

def list_space_and_sign_in_as_different_user
  enter_details_and_sign_up
  click_link('Spaces')
  list_a_space
  click_button('Sign out')
  enter_details_and_sign_up_guest
  click_link('Spaces')
end

def request_to_book_space_and_view_requests
  enter_details_and_sign_up
  click_link('Spaces')
  click_button('View details')
  click_button('Request to book')
  click_link('Requests')
end

def create_space
  host = User.create(firstname: 'matt',lastname: 'ward',email:'iammatthewward@gmail.com',password:'password123')
  space = Space.create(name: 'makers',description: 'very makers',user_id: host.id)
  available_period = AvailablePeriod.create(start_date: '2016-05-18', end_date: '2016-05-20', space_id:space.id)
  booking = Booking.create(confirmed:true, date: '2016-05-19', user_id:host.id, space_id:space.id)
end
