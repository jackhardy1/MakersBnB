
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
         image: params[:image],
         price: params[:price],
         user_id: session[:user_id])
    if params[:start_date] < params[:end_date]
        space.available_periods << AvailablePeriod.create(
        start_date: params[:start_date],
        end_date: params[:end_date],
        space_id: space.id)
        redirect '/spaces'
    elsif params[:start_date] > params[:end_date]
        flash[:notice] = 'End date should be after the start date'
        redirect '/spaces/new'
    end
  end

  post '/spaces/available' do
    session[:date] = params[:date]
    redirect '/spaces/available'
  end

  get '/spaces/available' do
    date = session[:date]
    @spaces = []
    @space_ids = []
    AvailablePeriod.each do |period|
      start_date = period.start_date.strftime('%F')
      end_date = period.end_date.strftime('%F')
      range = (start_date..end_date).to_a
      @space_ids << period.space_id if range.include?(date)
    end
      @space_ids.each do |space|
      @spaces << Space.get(space)
    end
    erb :'spaces/available'
  end

  get '/spaces/:id' do
    current_user
    @space = Space.get(params[:space_id])
    erb :'spaces/details'
  end

end
