require 'bcrypt'
class User < ApplicationRecord
  include BCrypt
  include Clearance::User

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { self.email = email.downcase }

  validates :email, presence: true, uniqueness: true,length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :mobile, numericality: {only_integer: true}, length: {is: 11 , message: "length should be 11"} 
end
