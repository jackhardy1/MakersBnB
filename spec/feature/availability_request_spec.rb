require 'spec_helper'

feature 'requesting to book' do
  scenario 'confirms availability of space' do
    list_space_and_sign_in_as_different_user
    click_button('view details')
    fill_in :date, with: '2017-05-22'
    click_button('request to book')
    expect(page).to have_content('Booking not available. Choose another date!')
  end

  scenario 'cannot book on booked date' do
    create_space
    enter_details_and_sign_up_guest
    click_button('View spaces')
    click_button('view details')
    fill_in :date, with: '2016-05-19'
    click_button('request to book')
    expect(page).to have_content('Booking not available. Choose another date!')
  end
end
