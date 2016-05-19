require 'spec_helper'

feature 'requesting to book' do
  scenario 'confirms availability of space' do
    enter_details_and_sign_up
    click_button('View spaces')
    click_button('list a space')
    fill_in :name, with: 'makers'
    fill_in :description, with: 'makers'
    fill_in :price, with: 10
    fill_in :start_date, with: '2017-05-18'
    fill_in :end_date, with: '2017-05-20'
    click_button('add space')
    click_button('view details')
    fill_in :date, with: '2017-05-22'
    click_button('request to book')
    expect(page).to have_content('Booking not available. Choose another date!')
  end

  scenario 'cannot book on booked date' do
    enter_details_and_sign_up
    click_button('View spaces')
    click_button('list a space')
    fill_in :name, with: 'makers'
    fill_in :description, with: 'makers'
    fill_in :price, with: 10
    fill_in :start_date, with: '2017-05-18'
    fill_in :end_date, with: '2017-05-20'
    click_button('add space')
    click_button('view details')
    fill_in :date, with: '2017-05-19'
    click_button('request to book')

    click_button('view details')
    fill_in :date, with: '2017-05-19'
    click_button('request to book')
    expect(page).to have_content('Booking not available. Choose another date!')
  end
end
