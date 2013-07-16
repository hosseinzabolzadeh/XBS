class Template < ActiveRecord::Base
  attr_accessible :description, :image, :name, :version
  has_many :appliances
end
