module Api
  module V1
    class UsersController < ApplicationController
      include Secured

      before_action :authenticate_user!, except: [:create]

      def create
        @user = User.create!(user_params)
        render json: @user, status: :created
      end

      def show
        render json: @user, serializer: ProfileSerializer, status: :ok
      end

      def update
        @user.update!(user_params)
        render json: @user, serializer: ProfileSerializer, status: :ok
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
  end
end
