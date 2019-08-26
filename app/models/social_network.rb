class SocialNetwork < ApplicationRecord
  self.inheritance_column = nil
  validates :type, presence: true

  belongs_to :contact
  validates_presence_of :contact
end
