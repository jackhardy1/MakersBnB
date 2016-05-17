require './app/models/user'

describe User do
  let(:user) { User.first(email: 'matthew@theinternet.com') }

  before :each do
    enter_details_and_sign_up
  end

  context 'password encryption' do
    it 'encrypts user password' do
      expect(user.password_digest).not_to eq 'password123'
    end

    it 'authenticates user when given correct log in details' do
      authenticated_user = User.authenticate('matthew@theinternet.com', 'password123')
      expect(authenticated_user).to eq user
    end

  end

end
