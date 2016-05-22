class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, String
  property :image, Text
  property :price, Integer

  belongs_to :user
  has n, :bookings
  has n, :available_periods

  # def send_confirmation_email
  #   RestClient.post "https://api:"+ENV['MAILGUN_API_KEY']+
  #   "@api.mailgun.net/v3/"+ENV['MAILGUN_SANDBOX_KEY']+".mailgun.org/messages",
  #   :from => "Thug Mansions <postmaster@"+ENV['MAILGUN_SANDBOX_KEY']+".mailgun.org>",
  #   :to => "#{self.user.firstname}, #{self.user.email}",
  #   :subject => "A guest has requested your place",
  #   :text => "Hi #{self.user.firstname}! A guest has requested to book your place. Check your requests!."
  # end

  def available?(booking_date, space_id)
    date = format_date(booking_date)
    confirmed_bookings = get_confirmed_bookings(space_id)
    available_period = get_available_periods(space_id)
    date_range = get_date_range(available_period)
    date_range.include?(date) && !(confirmed_bookings.include?(date))
  end

  private

  def get_confirmed_bookings(space_id)
    confirmed_bookings = []
    bookings = get_all_bookings(space_id)
    bookings.each do |booking|
    confirmed_bookings << booking.date if booking_confirmed?(booking)
    end
    confirmed_bookings
  end

  def get_all_bookings(space_id)
    Booking.all(space_id: space_id)
  end

  def booking_confirmed?(booking)
    booking.confirmed == true
  end

  def get_available_periods(space_id)
    available_period = AvailablePeriod.first(space_id: space_id)
  end

  def format_date(date)
    date = Date.parse(date)
  end

  def get_date_range(available_period)
    (available_period.start_date..available_period.end_date).to_a
  end

end
