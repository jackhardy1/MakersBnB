feature 'Enter user details on sign up' do

  scenario 'User can enter details' do
    enter_details_and_sign_up
    user = User.first
    expect(user.firstname).to eq 'Matthew'
    expect(user.lastname).to eq 'Ward'
    expect(user.email).to eq 'iammatthewward@gmail.com'
  end

  scenario 'Makes sure user has unique email' do
    2.times{enter_details_and_sign_up}
    expect(User.count).to eq 1
    expect(page).to have_content("Must have unique email")
  end

  scenario 'User must use valid email address' do
    incorrect_email
    expect(User.count).to eq 0
    expect(page).to have_content("Email is not valid")
  end

end
