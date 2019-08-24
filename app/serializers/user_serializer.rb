class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :address, :phone, :id, :photo_url
  attribute :api_key, if: :api_key?

  def api_key?
    true if object.api_key
  end
end
