ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'controllers/users'
require_relative 'controllers/spaces'
require_relative 'controllers/booking'
require_relative 'controllers/request'


class Bnb < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '')

  get '/' do
    current_user
    erb :index
  end




  # start the server if ruby file executed directly
end
