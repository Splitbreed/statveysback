class User < ApplicationRecord
  has_many :businesses
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :email_address, presence: true, uniqueness: true, email: true
  validates :name_first, presence: true
  validates :name_last, presence: true
end
