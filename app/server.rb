class Bnb < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash



end
