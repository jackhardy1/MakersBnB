require 'bcrypt'

class User

  include DataMapper::Resource

  has n, :spaces

  property :id,                Serial
  property :firstname,         String
  property :lastname,          String
  property :email,             String, unique: true, format: :email_address
  property :password_digest,   String, length: 60

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end


end
