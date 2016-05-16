require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class Bnb < Sinatra::Base
  get '/' do
    'Hello Bnb!'
  end

  get '/sign-up' do
    erb :signup
  end

  post '/users' do
    User.create(name: params[:name], email: params[:email], password: params[:password])
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
