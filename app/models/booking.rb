class Booking
  include DataMapper::Resource

  property :id, Serial
  property :confirmed, Boolean, :default => false
  property :date, Date

  belongs_to :user
  belongs_to :space

end
