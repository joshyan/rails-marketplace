module RailsMarketplace
	class OrderProduct < ActiveRecord::Base
		belongs_to :order
		belongs_to :product
		monetize :price_cents, :allow_nil => true
	end
end