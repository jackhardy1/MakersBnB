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
    click_button('view requests')
    expect(page).to have_content('Confirmed?')
  end
end

  feature 'host confirms request' do
    scenario 'request shows up with confirmed = true' do
      enter_details_and_sign_up
      click_button("View spaces")
      list_a_space
      click_button('Sign out')
      enter_details_and_sign_up_guest
      click_button('View spaces')
      expect(page).to have_content("makers")
      click_button('view details')
      click_button('request to book')
      click_button('view requests')
      expect(page).to have_content('Confirmed?')
    end

    scenario 'confirmed request sends confirmation email' do

    end
end
  feature 'host denies request' do
    scenario 'request is deleted from my requests' do

    end

    scenario 'denied request sends denial email' do
  end
end
