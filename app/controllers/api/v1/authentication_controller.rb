module Api
  module V1
class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /authentication/login
  def login
    @admin = Admin.find_by_email(params[:email])
    if @admin&.authenticate(params[:password])
      token = JsonWebToken.encode(admin_id: @admin.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @admin.user_name }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
  end
end
