# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  has_secure_password
  has_many :appliances, :dependent => :destroy
  has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
  has_many :followed_users, :through => :relationships, :source => :followed
  has_many :reverse_relationships, :foreign_key => "followed_id", :class_name => "Relationship", :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  validates(:first_name, :presence => true, :length => {:maximum => 50})
  validates(:last_name, :presence => true, :length => {:maximum => 50})
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, :presence => true, :format => { :with => VALID_EMAIL_REGEX }, :uniqueness => { :case_sensitive => false } )
  validate(:password, :presence => true, :length => {:minimum => 6 } )
  validate(:password_confirmation, :presence => true)
  
  def following?(other_user)
   relationships.find_by_followed_id(other_user)
  end

  def follow!(other_user)
   relationships.create!(:followed_id => other_user.id)
  end

  def unfollow!(other_user)
   relationships.find_by_followed_id(other_user).destroy
  end
  
  def app_feed
   Appliance.from_users_followed_by(self)
  end
  

  private
  def create_remember_token
   self.remember_token = SecureRandom.hex
  end
  
end
