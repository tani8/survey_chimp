require 'bcrypt'

class Creator < ActiveRecord::Base
  include BCrypt

  has_many :surveys

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: {:with => /@/}
  validates :password, presence: true

  def password
    # Initialize a BCrypt::Password instance from hashed password
    @password ||= Password.new(password_hash)
  end

  # This creates a hashed password from a clear text password
  # The hashed password is then stored in the password_hash member
  # that will be written to the database
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
