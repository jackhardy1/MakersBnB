feature 'User can add available dates to space' do

  scenario 'User adds availability when listing space' do
    enter_details_and_sign_up
    visit '/spaces/new'
    fill_in :name, with: 'Makers Academy'
    fill_in :description, with: 'It is a space'
    fill_in :price, with: 20
    fill_in :start_date, with: '2017-05-18'
    fill_in :end_date, with: '2017-05-20'
    click_button 'Add space'

    expect(page).to have_content 'Makers Academy'
    expect(page).to have_content 'It is a space'
    expect(page).to have_content 'Price per night: £20'
  end

  scenario 'User enters end date earlier than start date' do
    enter_details_and_sign_up
    visit '/spaces/new'
    fill_in :name, with: 'Makers Academy'
    fill_in :description, with: 'It is a space'
    fill_in :price, with: 20
    fill_in :start_date, with: '2017-05-20'
    fill_in :end_date, with: '2017-05-01'
    click_button 'Add space'

    expect(page).to have_content 'End date should be after the start date'
  end

end
