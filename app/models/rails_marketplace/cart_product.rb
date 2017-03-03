module RailsMarketplace
	class CartProduct < ActiveRecord::Base
		belongs_to :cart
		belongs_to :product
		monetize :price_cents, :allow_nil => true
	end
end