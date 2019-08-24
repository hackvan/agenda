class ProfileSerializer < ActiveModel::Serializer
  attributes :name, :email, :address, :phone, :id, :photo_url
end