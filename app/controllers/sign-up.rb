class Bnb < Sinatra::Base

  get '/sign-up' do
    erb :signup
  end

  post '/users' do
    user = User.create(firstname: params[:firstname], lastname: params[:lastname], email: params[:email], password: params[:password])
    if user.save
      redirect '/'
    elsif User.first(email: params[:email])
      flash[:notice] = "Must have unique email"
      redirect '/sign-up'
    else
      flash[:notice] = "Email is not valid"
      redirect '/sign-up'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
