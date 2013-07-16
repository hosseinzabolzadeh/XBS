class PackagesController < ApplicationController
 def new
 	@package=Package.new
 end
end
