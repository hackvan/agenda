class SocialNetwork < ApplicationRecord
  validates :type, presence:true
  
  belongs_to :contact
end
