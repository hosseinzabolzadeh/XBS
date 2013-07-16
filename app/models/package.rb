class Package < ActiveRecord::Base
  attr_accessible :name, :size, :version
end
