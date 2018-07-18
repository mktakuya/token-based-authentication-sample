class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :token, uniqueness: true

  class << self
    def generate_token
      loop do
        token = SecureRandom.hex
        break token unless User.where(token: token).exists?
      end
    end
  end
end
