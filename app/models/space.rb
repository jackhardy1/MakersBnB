require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, Text
  property :desciption, Text
  property :price, Text

  belongs_to :user
end
