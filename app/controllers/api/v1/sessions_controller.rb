class Api::V1::SessionsController < ApplicationController
  include Secured

  before_action :authenticate_user!, only: [:destroy]

  def create
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      user.generate_api_key
      render json: user, status: :ok
    else
      render json: { 
        status: 401,
        errors: [
          { detail: "No autorizado" }
        ]
      }, status: :unauthorized
    end
  end

  def destroy
    @user.destroy_api_key
    render json: {}, status: :ok
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end