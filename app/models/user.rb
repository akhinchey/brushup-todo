class User < ApplicationRecord
  has_secure_password

  has_many :lists
  has_many :tasks, through: :lists
  validates :username, presence: true
  validates :email, presence: true
end
