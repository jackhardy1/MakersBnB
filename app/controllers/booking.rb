class Bnb < Sinatra::Base

   post '/booking/new' do
     space = Space.get(params[:space_id])
     user = User.get(session[:user_id])
     date = params[:date]

     if space.available?(date, params[:space_id])
       booking = Booking.create(user_id: session[:user_id], space_id: space.id)
       user.bookings << booking
       user.save
       space.bookings << booking
       space.save
       redirect '/spaces'
     else
       flash[:notice] = 'Booking not available. Choose another date!'
       redirect '/spaces'
     end
   end

   get '/bookings' do
     erb :'bookings/new'
   end
end
