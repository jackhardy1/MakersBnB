require 'spec_helper'
require './app/models/user'

feature 'Enter user details on sign up' do

  scenario 'User can enter details' do
    visit '/sign-up'
    fill_in :name, with: 'Matthew'
    fill_in :email, with: 'matthew@theinternet.com'
    fill_in :password, with: 'seymour-butts'
    click_button 'Submit'
    user = User.first
    expect(user.name).to eq 'Matthew'
    expect(user.email).to eq 'matthew@theinternet.com'
    expect(user.password).to eq 'seymour-butts'
  end
end
