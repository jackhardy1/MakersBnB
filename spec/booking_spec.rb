require './app/models/booking'

describe Booking do

  describe 'creating a new booking' do

    before(:each) do
      user = User.create(firstname: 'Jack', lastname: 'Hardy', email: 'jackhardy1@gmail.com', password: 'jack')
      space = Space.create(name: 'makers', description: 'makers is good', price: 10)
      booking = Booking.create
      booking.space << space
      booking.user << user
      booking.save
    end

    it 'booking has a user' do
      expect(Booking.first.user.name).to eq 'Jack'
    end

    it 'booking has a space' do
      expect(Booking.space.name).to eq 'makers'
    end
  end
end
