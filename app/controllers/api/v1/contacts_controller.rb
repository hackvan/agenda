module Api
  module V1
    class ContactsController < ApplicationController
      include Secured

      before_action :authenticate_user!

      def index
        @contacts = @user.contacts
        render json: @contacts, status: :created
      end

      def create
        @contact = @user.contacts.create(contact_params)
        render json: @contact, status: :created
      end

      private

      def contact_params
        # To Do: Fix implementation for use social_network key instead
        # social_network_attributes
        # url: https://stackoverflow.com/questions/46853637/rails-5-1-api-how-to-permit-params-for-nested-json-objects-attributes
        params[:contact][:social_networks_attributes] = params[:contact].delete(:social_networks) if params[:contact][:social_networks]
        params.require(:contact)
              .permit(
                :name,
                :email,
                :address,
                :phone,
                social_networks_attributes: [:type, :url, :number, :id]
              )
      end
    end
  end
end
