class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, String
  property :price, Integer

  belongs_to :user
  has n, :bookings
  has n, :available_periods

  def available? (booking_date, space_id)
    date = Date.parse(booking_date)
    bookings = Booking.all(space_id: space_id)
    def_booked = []
    bookings.each do |booking|
      if booking.confirmed == true
        def_booked << booking.date
      end
    end
    available_period = AvailablePeriod.get(space_id)
    date_range = (available_period.start_date..available_period.end_date).to_a
    date_range.include?(date) && !(def_booked.include?(date))
  end
end
