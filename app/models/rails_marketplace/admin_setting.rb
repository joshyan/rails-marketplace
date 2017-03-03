module RailsMarketplace
  class AdminSetting < ActiveRecord::Base
  	belongs_to :admin

	def self.stripe_publishable_key
		first.stripe_publishable_key
	end

	def self.stripe_secret_key
		first.stripe_secret_key
	end
  end
end
