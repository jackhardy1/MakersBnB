def enter_details_and_sign_up
  visit '/sign-up'
  fill_in :firstname, with: 'Matthew'
  fill_in :lastname, with: 'Ward'
  fill_in :email, with: 'matthew@theinternet.com'
  fill_in :password, with: 'seymour-butts'
  click_button 'Submit'
end
