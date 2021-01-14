class User < ApplicationRecord
  has_secure_password
  has_many :mixes
  has_many :comments
  has_many :likes
  
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: {minimum: 7}

  
end
