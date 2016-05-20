# feature 'listing a new space' do
#   scenario 'so that user can add a new space' do
#     enter_details_and_sign_up
#     visit'/spaces/new'
#     fill_in('name', with: 'New name')
#     fill_in('description', with: 'new description')
#     fill_in('price', with: 40)
#     click_button("add space")
#     expect(current_path).to eq '/spaces'
#
#     within 'ul#spaces' do
#       expect(page).to have_content('New name')
#       expect(page).to have_content('Description: new description')
#       expect(page).to have_content('Price per night: 40')
#     end
#   end
# end
