
class Bnb < Sinatra::Base

  get '/spaces' do
    current_user
    erb :'spaces/listings'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
     user = session[:user_id]
     space = Space.create(name: params[:name],
                    description: params[:description],
                    price: params[:price], user_id: session[:user_id])

    if params[:start_date] < params[:end_date]
      space.available_periods << AvailablePeriod.create(
      start_date: params[:start_date],
      end_date: params[:end_date],
      space_id: space.id)
      redirect '/spaces'
    elsif params[:start_date] > params[:end_date]
      flash[:notice] = 'End date should be after the start date'
      redirect '/spaces/new'
      # elsif params[:start_date] < DateTime.now.to_date.to_s
      #   flash[:notice] = 'Start date should be after today'
      #   redirect '/spaces/new'
    end

  end

  get '/spaces/:id' do
    current_user
    @space = Space.get(params[:space_id])
    erb :'spaces/details'
  end
end
