require 'sinatra/base'
require_relative 'data_mapper_setup'


class Bnb < Sinatra::Base
  get '/' do
    'Hello Bnb!'
  end




  # start the server if ruby file executed directly
  run! if app_file == $0
end
