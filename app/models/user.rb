class User < ApplicationRecord
  has_many :upvotes, dependent: :destroy
  has_many :ideas, dependent: :destroy
  has_many :versions, through: :ideas

  # moving to the controller, with permitted parameters
  # https://stackoverflow.com/a/17371364
  # attr_accessible :email, :username, :password_confirmation

  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :username, :on => :create
  validates_uniqueness_of :email
  validates_uniqueness_of :username

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine::generate_salt
      self.password_hash = BCrypt::Engine::hash_secret(password, password_salt)
    end
  end
end
