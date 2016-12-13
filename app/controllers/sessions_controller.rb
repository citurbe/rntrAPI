class SessionsController < ApplicationController
  # skip_before_action :authenticate_user
  def create
    user = User.find_by(email: auth_params[:email])

    if !!user && user.authenticate(auth_params[:password])
      jwt = Auth.issue({user_id: user.id})
      render json: {jwt: jwt, user_id: user.id, user_email: user.email, commute: user.commute, amenities: user.amenities, schools: user.schools, destination: user.destination, safety: user.safety, category_1: user.category_1, category_2: user.category_2, category_3: user.category_3, apartments: user.apartments}
    else
      render json: {error: 'Invalid login'}
    end
  end

  # def destroy
  #     jwt = null
  #     render json: {jwt: jwt}
  # end


   private
    def auth_params
      params.require(:user).permit(:email, :password)
    end

end
