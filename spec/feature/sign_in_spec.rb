require 'spec_helper'
require './app/models/user'

feature 'A registered user can log in' do

  scenario 'Is greeted upon log in' do
    enter_details_and_sign_up
    expect(page).to have_content 'Hello Matthew!'
  end

  scenario 'Gets error if wrong login details' do
    enter_details_and_sign_up
    incorrect_password
    expect(page).to have_content 'Incorrect login details'
  end

  scenario 'Sign out button visible when signed in' do
    enter_details_and_sign_up
    expect(page).to have_content 'Sign out'
  end

  scenario 'Sign out button not visible when not signed in' do
    visit '/'
    expect(page).not_to have_content 'Sign out'
  end

  scenario 'Sign out button ends user session' do
    enter_details_and_sign_up
    click_button 'Sign out'
    expect(page).not_to have_content 'Hello Matthew!'
    expect(page).not_to have_content 'Sign out'
  end

end
