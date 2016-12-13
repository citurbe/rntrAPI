class ApplicationController < ActionController::API
  

  def authenticate_user
    render json:{error: "Unauthorized User"} unless signed_in?
  end

  def signed_in?
    !!current_user
  end

  def current_user
    User.find(Auth.decode(request.env["HTTP_AUTHORIZATION"][0]["user_id"])) if request.env["HTTP_AUTHORIZATION"].present?
  end

  private

  def token
    request.env["HTTP_AUTHORIZATION"].scan(/Bearer/).flatten.last
  end

  def auth_present?
    !!request.env.fetch("HTTP_AUTHORIZATION", "").scan(/Bearer/).flatten.first
  end


end
