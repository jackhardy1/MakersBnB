require 'spec_helper'

feature 'request to book' do
  scenario 'after requesting, expect to see booking details' do
    user = User.create(id: 1, firstname: 'jack', lastname: 'hardy', email: 'jack@jack.com', password: 'jack')
    space = Space.create(name: 'makers',description: 'makers',price: 10, user_id: 1)
    enter_details_and_sign_up
    click_button('View spaces')
    expect(page).to have_content("makers")
    click_button('view details')
    click_button('request to book')
    expect(page).to have_content('Booking confirmed? false')
  end
end
