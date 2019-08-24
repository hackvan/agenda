class Api::V1::ContactsController < ApplicationController
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
    params.require(:contact)
      .permit(
        :name,
        :email,
        :address,
        :phone,
        # social_networks: [ :type, :url, :number ]
      )
  end
end
