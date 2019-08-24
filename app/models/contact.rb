class Contact < ApplicationRecord

  validates :name,  presence: true
  validates :email, presence: true,
                    format: /\A\S+@\S+\z/

  belongs_to :user
  has_many :social_networks

  accepts_nested_attributes_for :social_networks, allow_destroy: true
end
