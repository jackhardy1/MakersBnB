class Bnb < Sinatra::Base

   post '/booking/new' do
     space = Space.get(params[:space_id])
     user = User.get(session[:user_id])
     booking = Booking.create(user_id: session[:user_id], space_id: space.id)
     user.bookings << booking
     user.save
     space.bookings << booking
     space.save
     redirect '/spaces'
  end

   get '/bookings' do
     erb :'bookings/new'
   end
end
