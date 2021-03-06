class User < ActiveRecord::Base
  has_many :posts
  has_many :contacts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :confirmable


  def password_required?
    super && facebook_uid.blank?
  end

end
