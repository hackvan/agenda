class ContactSerializer < ActiveModel::Serializer
  attributes :name, :email, :address, :phone, :id, :social_networks

  def social_networks 
    self.object.social_networks.map do |sn|
      { 
       type:   sn.type, 
       url:    sn.url,
       number: sn.number
      }
    end 
  end 
end
