require 'bcrypt'
class User < ApplicationRecord
  include BCrypt
  include Clearance::User
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
