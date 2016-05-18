class Booking
  include DataMapper::Resource

  property :id, Serial
  property :confirmed, Boolean, :default => false

  belongs_to :user
  belongs_to :space

end
