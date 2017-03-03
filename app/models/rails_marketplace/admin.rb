module RailsMarketplace
	class Admin < ActiveRecord::Base
		has_one :admin_setting
		
		validates :name, :presence => true
		validates :email, :presence => true
		has_secure_password
		
	end
end