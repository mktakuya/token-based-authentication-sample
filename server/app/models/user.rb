class User < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :token, uniqueness: true
end
