class User < ApplicationRecord
  has_secure_password
  
  validates :name,  presence: true
  validates :email, presence: true,
                    format: /\A\S+@\S+\z/,
                    uniqueness: { case_sensitive: false }

  def generate_api_key
    self.api_key = TokenGenerationService.generate if self.api_key.blank?
    save
  end

  def destroy_api_key
    self.api_key = nil
    save
  end
end
