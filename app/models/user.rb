class User

  include DataMapper::Resource

  property :id,         Serial
  property :firstname,  String
  property :lastname,   String
  property :email,      String, unique: true, format: :email_address
  property :password,   String



end
