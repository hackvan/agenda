class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :address, :phone, :id, :photo_url
end
