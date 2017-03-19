require_dependency "rails_marketplace/application_controller"

module RailsMarketplace
	class CatalogController < ApplicationController

		before_action :set_current_category, :only => [:category_products, :product_detail]
		before_action :set_current_cart, :only => [:add_to_cart, :purchase, :cart, :cart_update, :cart_delete, :checkout, :charge]
		after_action :reset_success_orders, :only => [:checkout_success]

		def index

		end
		
		def category_products
			@products = @category.products
		end

		def product_detail
			@product = Product.friendly.find(params[:title])
		end

		def add_to_cart
			@cart.add_product params[:product_id], params[:quantity]
			redirect_to cart_path
		end

		def purchase
			@cart.add_product params[:product_id], params[:quantity]
			redirect_to checkout_path
		end

		def cart
			@cart_quantity = @cart.cart_quantity
			@cart_subtotal = @cart.cart_subtotal
		end

		def cart_update
			@cart.update_product params[:product_id], params[:quantity]
		end

		def cart_delete
			@cart.delete_product params[:product_id]
			redirect_to cart_path
		end

		def checkout
			@total = @cart.cart_subtotal
			@amount = @cart.cart_subtotal.cents
			@product_groups = @cart.get_product_groups
		end

		def charge
			Stripe.api_key = AdminSetting.stripe_secret_key
		  	# Amount in cents
		  	@subtotal = @cart.cart_subtotal.cents
		  	#@shipping_total = 
		  	#@tax_total = 

		  	charge_total = @subtotal

			# Get the credit card details submitted by the form
			token = params[:stripeToken]
			group_order_id = get_new_group_order_id
			# Create a charge: this will charge the user's card
			begin
			  charge = Stripe::Charge.create(
			    :amount => charge_total, # Amount in cents
			    :currency => "usd",
			    :source => token,
			    :transfer_group => group_order_id
			  )
			rescue Stripe::CardError => e
			  # The card has been declined
			  flash[:error] = e.message
		  	  redirect_to checkout_path
			end

			order_params = {
				email: params[:email], 
				fullname: params[:fullname],
				address1: params[:address1],
				address2: params[:address2],
				city: params[:city],
				state: params[:state],
				zip: params[:zip],
				country: params[:country],
				phone: params[:phone],
				is_gift: params[:is_gift],
				gift_message: params[:gift_message]		
			}
			# group products by seller
			product_groups = @cart.get_product_groups
			i = 0
			product_groups.each do |seller_id, cart_products|
				i += 1
				order_params[:id] = "#{group_order_id}-#{i}"
				order_params[:seller_id] = seller_id
				order_params[:shipping_method] = params[:shipping_method][seller_id.to_s]
				
				# transfer to seller account 
				seller_subtotal = get_seller_subtotal(cart_products).cents
				# seller_shipping_fee = get_seller_shipping seller_id, params[:shipping_method][seller_id.to_s]
				seller_total = seller_subtotal
				
				# assumming 5% marketplace fee, 2% stripe fee
				seller_transfer_total = (seller_total * 0.93).to_i

				# Create a Transfer to a connected account (later):
				transfer = Stripe::Transfer.create({
				  :amount => seller_transfer_total,
				  :currency => "usd",
				  :destination => "#{SellerSetting.find_by_seller_id(seller_id).stripe_account_id}",
				  :transfer_group => "#{group_order_id}",
				})

				# save seller's order
				order = Order.new(order_params)
				order.save
				order.save_products cart_products
				(session[:order_ids] ||= []) << order.id

			end
			# todo: send email
			redirect_to checkout_success_path
		end

		def checkout_success
			# todo: only show after checkout success
			if session[:order_ids]
				@order_ids = session[:order_ids]
			else
				redirect_to cart_path
			end
			session.delete(:cart_id)
		end


		private
			def set_current_category
				if params[:name]
					session[:current_category_name] = params[:name]
				end
				return unless session[:current_category_name]
				@category ||= Category.friendly.find(session[:current_category_name])
			end

			def set_current_cart
		    	@cart ||= Cart.find(session[:cart_id])

		    rescue ActiveRecord::RecordNotFound
		        @cart = Cart.create
		        session[:cart_id] = @cart.id
			end
			
			def reset_success_orders
				session.delete(:order_ids)
			end

			# todo: generate unique order id
			def get_new_group_order_id
				"20170319"
			end

			def get_seller_subtotal(cart_products)
				subtotal = 0
				cart_products.each do |cart_product|
					subtotal += cart_product.quantity * cart_product.price
				end
				subtotal
			end
	end
end