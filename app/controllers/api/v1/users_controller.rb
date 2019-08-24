class Api::V1::UsersController < ApplicationController
  rescue_from Exception do |e|
    render json: { 
      status: 500,
      errors: { 
        detail: e.message 
      }
    }, status: :internal_error
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { 
      status: 422,
      errors: {
        detail: e.message
      }
    }, status: :unprocessable_entity
  end

  def create
    @user = User.create!(user_params)
    render json: @user, status: :created
  end

  private
  def user_params
    params.require(:user)
      .permit(
        :name, 
        :email, 
        :address, 
        :phone, 
        :password,
        :password_confirmation
      )
  end
end
