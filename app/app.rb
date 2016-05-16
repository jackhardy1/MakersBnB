require 'sinatra/base'

class Bnb < Sinatra::Base
  get '/' do
    'Hello Bnb!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
