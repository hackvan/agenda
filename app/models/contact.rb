class Contact < ApplicationRecord
  validates :name,  presence: true
  validates :email, presence: true,
                    format: /\A\S+@\S+\z/

  belongs_to :user
  has_many   :social_networks, dependent: :destroy

  accepts_nested_attributes_for :social_networks,
                                allow_destroy: true,
                                reject_if: :reject_social_networks

  def reject_social_networks(attributes)
    attributes['type'].blank?
  end
end
