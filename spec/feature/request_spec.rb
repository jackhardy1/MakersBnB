require 'spec_helper'

feature 'request to book' do
  scenario 'after requesting, expect to see booking details' do
    create_space
    enter_details_and_sign_up_guest
    click_button('View spaces')
    expect(page).to have_content("makers")
    click_button('view details')
    fill_in :date ,with: '2016-05-20'
    click_button('request to book')
    click_button('view requests')
    expect(page).to have_content('Confirmed?')
  end
end
