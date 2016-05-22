require 'spec_helper'

feature 'request to book' do
  scenario 'after requesting, expect to see booking details' do
    create_space
    enter_details_and_sign_up_guest
    click_link 'Spaces'
    expect(page).to have_content 'makers'
    click_button 'View details'
    fill_in :date ,with: '2016-05-20'
    click_button 'Request to book'
    click_link 'Requests'
    expect(page).to have_content 'Awaiting confirmation'
  end
end
