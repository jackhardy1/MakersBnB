class AvailablePeriod
  include DataMapper::Resource

  belongs_to :space

  property :id, Serial
  property :start_date, Date
  property :end_date, Date

end
