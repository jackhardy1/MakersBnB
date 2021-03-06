class Bnb < Sinatra::Base

  get '/sign-up' do
    erb :'users/signup'
  end

  post '/users' do
    user = User.create(firstname: params[:firstname], lastname: params[:lastname], email: params[:email], password: params[:password])
    if user.save
      session[:user_id] = user.id
      redirect '/'
    elsif User.first(email: params[:email])
      flash[:notice] = "Must have unique email"
      redirect '/sign-up'
    else
      flash[:notice] = "Email is not valid"
      redirect '/sign-up'
    end
  end

  get '/sign-in' do
    erb :'users/signin'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:notice] = "Incorrect login details"
      redirect('/sign-in')
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
