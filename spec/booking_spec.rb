require './app/models/booking'

describe Booking do

  describe 'creating a new booking' do

    before(:each) do
      user = User.create(firstname: 'Jack', lastname: 'Hardy', email: 'jackhardy1@gmail.com', password: 'jack')
      space = Space.create(name: 'makers', description: 'makers is good', price: 10, user_id: user.id)
      booking = Booking.create
      space.bookings << booking
      user.bookings << booking
      booking.save
    end

    it 'booking has a user' do
      our_booking = Booking.first
      expect(our_booking.user.id).to eq 1
    end

    it 'booking has a space' do
      our_booking = Booking.first
      expect(our_booking.space.name).to eq 'makers'
    end
  end
end
