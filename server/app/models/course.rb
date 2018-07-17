class Course < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true
  validates :code, uniqueness: true
  validates :credit, presence: true
  validates :instructor, presence: true
  validates :content, presence: true
end
