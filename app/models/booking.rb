class Booking
  include DataMapper::Resource

  property :id, Serial
  property :confirmed, Boolean, :default => false

  belongs_to :user
  belongs_to :space

  def send_confirmation_email
    RestClient.post "https://api:key-db9947c7c306f3e89c62e449a8682f14"\
    "@api.mailgun.net/v3/sandbox33c818f0b5394c619eeced5f869ece17.mailgun.org/messages",
    :from => "Thug Mansions <postmaster@sandbox33c818f0b5394c619eeced5f869ece17.mailgun.org>",
    :to => "#{self.user.firstname}, #{self.user.email}",
    :subject => "You're going to #{self.space.name}!",
    :text => "Hi #{self.user.firstname}! Your request to book #{self.space.name} has been approved."
  end

  def send_denial_email
    RestClient.post "https://api:key-db9947c7c306f3e89c62e449a8682f14"\
    "@api.mailgun.net/v3/sandbox33c818f0b5394c619eeced5f869ece17.mailgun.org/messages",
    :from => "Thug Mansions <postmaster@sandbox33c818f0b5394c619eeced5f869ece17.mailgun.org>",
    :to => "Macey, #{self.user.email}",
    :subject => "Booking request denied",
    :text => "Hi #{self.user.firstname}, Your request to book #{self.space.name} has been denied."
  end

end
