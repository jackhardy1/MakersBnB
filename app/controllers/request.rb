 class Bnb < Sinatra::Base

  get '/requests' do
    current_user
    erb :'requests/view'
  end

  post '/request/:id' do
    session[:booking_id] = params[:booking_id]
    redirect '/request/:id'
  end

  get '/request/:id' do
    current_user
    @booking = Booking.get(session[:booking_id])
    erb :'requests/confirm'
  end

  post '/requests/confirm' do
    booking = Booking.get(session[:booking_id])
    booking.update(confirmed: true)
    booking.send_confirmation_email
    redirect '/requests'
  end

  post '/requests/deny' do
    booking = Booking.get(session[:booking_id])
    booking.send_denial_email
    booking.destroy
    redirect '/requests'
  end
end
