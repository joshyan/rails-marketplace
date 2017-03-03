module RailsMarketplace
	class Order < ActiveRecord::Base
		has_many :order_products
		has_many :products, :through => :order_products
		belongs_to :customer
		belongs_to :seller

		def save_products(cart_products)
			cart_products.each do |cart_product|
				order_products << OrderProduct.new(product_id: cart_product.product_id, quantity: cart_product.quantity, price: cart_product.price)
			end
		end

		def order_subtotal
			subtotal = 0
			order_products.each do |order_product|
				subtotal += order_product.quantity * order_product.price
			end
			subtotal
		end
	end
end