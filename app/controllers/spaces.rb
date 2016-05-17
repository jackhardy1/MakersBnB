
class Bnb < Sinatra::Base

  get '/spaces' do
  # @spaces = Space.all
    erb :'spaces/listings'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    space = Space.create(name: params[:name],
         description: params[:description],
         price: params[:price])
         space.save
         redirect '/spaces'
  end
end
