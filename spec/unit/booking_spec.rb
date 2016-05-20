require './app/models/booking'

describe Booking do

  describe 'creating a new booking' do

    before(:each) do
      user = User.create(firstname: 'Jack', lastname: 'Hardy', email: 'jackhardy1@gmail.com', password: 'jack')
      space = Space.create(name: 'makers', description: 'makers is good', price: 10, user_id: user.id)
      avail_period = AvailablePeriod.create(start_date: '2016-05-18', end_date: '2016-05-20', space_id: space.id)
      space.available_periods << avail_period
      booking = Booking.create
      space.bookings << booking
      user.bookings << booking
      booking.save
    end

    it 'booking has a user' do
      our_booking = Booking.first
      expect(our_booking.user.id).not_to eq nil
    end

    it 'booking has a space' do
      our_booking = Booking.first
      expect(our_booking.space.name).to eq 'makers'
    end

    it 'checks availability period' do
      space = Space.first
      expect(space.available?('2016-05-25', space.id)).to eq(false)
    end
  end
end
