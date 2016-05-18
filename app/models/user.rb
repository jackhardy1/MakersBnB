require 'bcrypt'

class User

  include DataMapper::Resource


  property :id,                Serial
  property :firstname,         String
  property :lastname,          String
  property :email,             String, unique: true, format: :email_address
  property :password_digest,   String, length: 60

  has n, :spaces
  has n, :bookings
  
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = User.first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end

  end


end
