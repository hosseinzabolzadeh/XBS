class Appliance < ActiveRecord::Base
  attr_accessible :description, :icon, :name, :activation
  before_save {set_defaults}
  belongs_to :user
  validates :name, :presence => true, :length => {:maximum => 50}
  validates :user_id, :presence => true
  default_scope :order => 'appliances.created_at DESC'

  private
  def set_defaults
   if self.activation.nil?
    self.activation = false
   end
  end
end
