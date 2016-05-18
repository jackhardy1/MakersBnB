class Bnb < Sinatra::Base

  post '/requests' do
    space = Space.get(params[:space_id])
    user = User.get(session[:user_id])
    booking = Booking.create(user_id: session[:user_id], space_id: space.id)
    user.bookings << booking
    p user.save
    space.bookings << booking
    space.save
    redirect '/request/new'
