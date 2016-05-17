require 'spec_helper'
require './app/models/user'

feature 'A registered user can log in' do

  scenario 'Is greeted upon log in' do
    enter_details_and_sign_up
    log_in
    expect(page).to have_content 'Hello Matthew!'
  end

  scenario 'Gets error if wrong login details' do
    enter_details_and_sign_up
    incorrect_password
    expect(page).to have_content 'Incorrect login details'
  end

end
