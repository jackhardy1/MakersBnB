require './app/models/user'


describe User do

  context 'password encryption' do

    it 'encrypts user password' do
      enter_details_and_sign_up
      user = User.first(email: 'matthew@theinternet.com')
      expect(user.password_digest).not_to eq 'password123'
    end

  end

end
