class User < ApplicationRecord
  has_secure_password

  validates :name,  presence: true
  validates :email, presence: true,
                    format: /\A\S+@\S+\z/,
                    uniqueness: { case_sensitive: false }

  has_many  :contacts

  def generate_api_key
    if self.api_key.blank?
      self.api_key = TokenGenerationService.generate 
      save
    end
    self.api_key
  end

  def destroy_api_key
    self.api_key = nil
    save
  end
end
