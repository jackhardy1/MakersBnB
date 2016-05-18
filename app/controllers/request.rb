class Bnb < Sinatra::Base

  get '/requests' do
    erb :'requests/view'
  end

  post '/request/:id' do
    session[:booking_id] = params[:booking_id]
    redirect '/request/:id'
  end

  get '/request/:id' do
    @booking = Booking.get(session[:booking_id])
    erb :'requests/confirm'
  end

  post '/requests/confirm' do
    booking = Booking.get(session[:booking_id])
    booking.update(confirmed: true)
    redirect '/requests'
  end

  post '/requests/deny' do
    booking = Booking.get(session[:booking_id])
    booking.destroy
    redirect '/requests'
  end
end
