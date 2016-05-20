require 'dotenv'
Dotenv.load

class Booking
  include DataMapper::Resource

  property :id, Serial
  property :confirmed, Boolean, :default => false
  property :date, Date

  belongs_to :user
  belongs_to :space

  def send_confirmation_email
<<<<<<< HEAD
      RestClient.post "https://api:"+ENV['MAILGUN_API_KEY']+
      "@api.mailgun.net/v3/"+ENV['MAILGUN_SANDBOX_KEY']+".mailgun.org/messages",
      :from => "Thug Mansions <postmaster@"+ENV['MAILGUN_SANDBOX_KEY']+".mailgun.org>",
      :to => "#{self.user.firstname}, #{self.user.email}",
      :subject => "You're going to #{self.space.name}!",
      :text => "Hi #{self.user.firstname}! Your request to book #{self.space.name} has been approved."
    end

    def send_denial_email
      RestClient.post "https://api:"+ENV['MAILGUN_API_KEY']+
      "@api.mailgun.net/v3/"+ENV['MAILGUN_SANDBOX_KEY']+".mailgun.org/messages",
      :from => "Thug Mansions <postmaster@"+ENV['MAILGUN_SANDBOX_KEY']+".mailgun.org>",
      :to => "#{self.user.firstname}, #{self.user.email}",
      :subject => "Booking request denied",
      :text => "Hi #{self.user.firstname}, Your request to book #{self.space.name} has been denied."
    end
=======
    RestClient.post "https://api:"+ENV['MAILGUN_API_KEY']+
    "@api.mailgun.net/v3/"+ENV['MAILGUN_SANDBOX_KEY']+".mailgun.org/messages",
    :from => "Thug Mansions <postmaster@"+ENV['MAILGUN_SANDBOX_KEY']+".mailgun.org>",
    :to => "#{self.user.firstname}, #{self.user.email}",
    :subject => "You're going to #{self.space.name}!",
    :text => "Hi #{self.user.firstname}! Your request to book #{self.space.name} has been approved."
  end

  def send_denial_email
    RestClient.post "https://api:"+ENV['MAILGUN_API_KEY']+
    "@api.mailgun.net/v3/"+ENV['MAILGUN_SANDBOX_KEY']+".mailgun.org/messages",
    :from => "Thug Mansions <postmaster@"+ENV['MAILGUN_SANDBOX_KEY']+".mailgun.org>",
    :to => "Macey, #{self.user.email}",
    :subject => "Booking request denied",
    :text => "Hi #{self.user.firstname}, Your request to book #{self.space.name} has been denied."
  end
>>>>>>> ec0fb52e34a2f4b557189b9a21177abad4e69618

end
