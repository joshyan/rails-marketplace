module RailsMarketplace
	class Seller < ActiveRecord::Base
		has_many :products
		has_many :orders
		has_one :seller_setting
		
		validates :first_name, :presence => true
		validates :last_name, :presence => true
		validates :email, :presence => true
		has_secure_password

	end
end