require 'bcrypt'
class User < ActiveRecord::Base
  attr_accessor :password
  has_many :questions
  has_many :answers
  validates_confirmation_of :password
  before_create :encrypt_password

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.where(username: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end

# # users.password_hash in the database is a :string
# include BCrypt
#
# def password
#   @password ||= Password.new(password_hash)
# end
#
# def password=(new_password)
#   @password = Password.create(new_password)
#   self.password_hash = @password
# end
#
# def create
#   @user = User.new(params[:user])
#   @user.password = params[:password]
#   @user.save!
# end
#
# def login
#   @user = User.find_by_email(params[:email])
#   if @user.password == params[:password]
#     give_token
#   else
#     redirect_to home_url
#   end
# end
