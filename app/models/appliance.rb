class Appliance < ActiveRecord::Base
  attr_accessible :description, :icon, :name, :activation, :arch, :template_id
  after_initialize :default_values
  belongs_to :user
  validates :name, :presence => true, :length => {:maximum => 50}
  validates :user_id, :presence => true
  default_scope :order => 'appliances.created_at DESC'
  belongs_to :templates
  
  def self.from_users_followed_by(user)
   followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
   where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", :user_id => user.id)
  end


  private
  def default_values
    self.activation ||= "false"
    self.icon ||= "App.png"
  end
end
