

class UsersController < ApplicationController


 def show
    user = User.find_by(email: params[:email])
    jwt = Auth.issue({user_id: user.id})
     render json: {jwt: jwt, user_id: user.id, user_email: user.email}
 end

 def create
   user = User.new(user_params)

   if user.save
     jwt = Auth.issue({user_id: user.id})
     render json: {jwt: jwt, user_id: user.id, user_email: user.email}

   else
     error_message = user.errors.messages.map {|key, value| key.to_s + ": " + value.join(', ')}.join(', ')
     render json: {error: error_message}
   end

 end

  # def delete
  #   apartment = Apartment.find(params['id']).destroy
  #   render json: { Apartment.all }
  # end

 def update

   userId = Auth.decode(params["token"])["user_id"]
   user = User.find(userId)
   user.update(pref_params)
   render json: {user_id: user.id, destination: user.destination, commute: user.commute, safety:user.safety, amenities: user.amenities, schools: user.schools, category_1: user.category_1, category_2: user.category_2, category_3: user.category_3}


 end

 def index
   @users = User.all
   render json: {users: @users.to_json}
 end

 def user_params
   params.require(:user).permit(:email, :password, :commute, :safety, :destination, :schools, :amenities, :category_1, :category_2, :category_3)
 end

 def pref_params
   params.require(:prefState).permit(:destination, :commute, :schools, :amenities, :safety, :category_1, :category_2, :category_3)
 end

end
