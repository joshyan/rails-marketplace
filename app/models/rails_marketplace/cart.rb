module RailsMarketplace
	class Cart < ActiveRecord::Base
		has_many :cart_products, :dependent => :destroy
		has_many :products, :through => :cart_products
		belongs_to :customer

		def add_product(product_id, quantity)
		  cart_product = cart_products.where('product_id = ?', product_id).first
		  if cart_product
		    # increase the quantity of product in cart
		    cart_product.quantity = cart_product.quantity + quantity.to_i
		    cart_product.save
		  else
		    # product does not exist in cart
		    cart_products << CartProduct.new(product_id: product_id, quantity: quantity, price: Product.find(product_id).price)
		  end
		end

		def delete_product(product_id)
			cart_products.delete(CartProduct.find_by(product_id: product_id))
		end

		def cart_quantity
			total = 0
			cart_products.each do |cart_product|
				total += cart_product.quantity
			end
			total
		end

		def cart_subtotal
			subtotal = 0
			cart_products.each do |cart_product|
				subtotal += cart_product.quantity * cart_product.price
			end
			subtotal
		end

		def get_product_groups
			product_groups = {}
			cart_products.each do |cart_product|
				seller_id = Product.find(cart_product.product_id).seller.id
				(product_groups[seller_id] ||= []) << cart_product
			end
			product_groups
		end

	end
end