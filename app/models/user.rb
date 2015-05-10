class User < ActiveRecord::Base
  # To use devise-twitter don't forget to include the :twitter_oauth module:
  # e.g. devise :database_authenticatable, ... , :twitter_oauth

  # IMPORTANT: If you want to support sign in via twitter you MUST remove the
  #            :validatable module, otherwise the user will never be saved
  #            since it's email and password is blank.
  #            :validatable checks only email and password so it's safe to remove

  has_many :posts
  has_many :contacts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :confirmable


  def password_required?
    super && facebook_uid.blank?
  end

end
