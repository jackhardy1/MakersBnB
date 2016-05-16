class User

  include DataMapper::Resource

  property :id,         Serial
  property :firstname,  String
  property :lastname,   String
  property :email,      String, unique: true
  property :password,   String



end
