ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'controllers/sign-up'
require_relative 'controllers/spaces'
require_relative 'server'

class Bnb < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '')

  get '/' do
    'Hello Bnb!'
  end




  # start the server if ruby file executed directly
  run! if app_file == $0
end
