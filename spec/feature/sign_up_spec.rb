require 'spec_helper'
require_relative 'web_helpers'
require './app/models/user'

feature 'Enter user details on sign up' do

  scenario 'User can enter details' do
    enter_details_and_sign_up
    user = User.first
    expect(user.firstname).to eq 'Matthew'
    expect(user.lastname).to eq 'Ward'
    expect(user.email).to eq 'matthew@theinternet.com'
    expect(user.password).to eq 'seymour-butts'
  end

  scenario 'Makes sure user has unique email' do
    2.times{enter_details_and_sign_up}
    expect(User.count).to eq 1
    expect(page).to have_content("Must have unique email")
  end

end
