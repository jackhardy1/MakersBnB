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
    p date = Date.parse(booking_date)
    p available_period = AvailablePeriod.get(space_id)
    p date_range = (available_period.start_date..available_period.end_date).to_a
    p date_range.include?(date)
  end

end
