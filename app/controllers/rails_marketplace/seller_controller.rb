require_dependency "rails_marketplace/application_controller"

module RailsMarketplace
	class SellerController < ApplicationController
		layout 'rails_marketplace/seller_central'
		include SellerHelper

		before_action :require_login, :except => [:login_form, :login, :signup_form, :signup]
		before_action :set_current_seller
		before_action :set_current_product, :only => [:edit_product, :update_product, :delete_product]

		def login_form
			if seller_logged_in?
				redirect_to seller_dashboard_path
			end
		end

		def login
		    seller = Seller.find_by(email: params[:seller][:email].downcase)
		    if seller && seller.authenticate(params[:seller][:password])
		      seller_log_in seller
		      redirect_to seller_dashboard_path
		    else
		      flash[:error] = 'Invalid email/password combination'
		      render 'login_form'
		    end
		end

		def signup_form
			@seller = Seller.new
		end

		def signup
			@seller = Seller.new(seller_params)
			if @seller.save
				if @seller.seller_setting.nil?
					SellerSetting.create seller_id: @seller.id

					Stripe.api_key = AdminSetting.stripe_secret_key

					managed_account = Stripe::Account.create(
					  :managed => true,
					  :country => 'US',
					  :email => @seller.email
					)

					seller_setting = SellerSetting.find_by_seller_id(@seller.id)
					seller_setting.update_attributes({:stripe_account_id => managed_account.id, :stripe_secret_key => managed_account.keys.secret, :stripe_publishable_key => managed_account.keys.publishable})
				end
				seller_log_in @seller
				redirect_to seller_dashboard_path
			else
		      	render 'signup_form'
		    end
		end

		def logout
			seller_log_out
			redirect_to seller_login_path
		end

		def dashboard

		end

		def products
			@products = Product.where(seller: @current_seller)
		end

		def add_product
			@product = Product.new
		end

		def create_product
			@product = Product.new(product_params)
			@product.seller = @current_seller
			if @product.save
				flash[:notice] = 'New product was successfully added!'
				redirect_to seller_products_path
			else
		      	render 'add_product'
		    end
		end

		def edit_product

		end

		def update_product
			if @product.update_attributes(product_params)
				flash[:notice] = 'Product was successfully updated!'
				redirect_to seller_products_path
			else
		      	render 'update_product'
		    end		
		end

		def delete_product
			@product.destroy
			redirect_to seller_products_path
		end

		def add_bulk_products
			
		end

		def orders
			@orders = Order.where(seller_id: @current_seller.id)
			# @order_products = OrderProduct.where(seller: @current_seller)
		end

		def order_details
			order_id = params[:order_id]
			@order = Order.find(order_id)
			if @order.seller_id != @current_seller.id
				flash[:error] = "The page you’re looking for could not be found. Please make sure the web address is correct."
				redirect_to seller_orders_path
			end
			
			@order_products = @order.order_products
		end

		def settings_general
			
		end

		def settings_general_update
			@current_seller.update_attributes(seller_params)
			redirect_to seller_dashboard_path
		end

		def settings_shipping

		end

		def settings_shipping_update

		end	

		def settings_payment

		end

		def settings_payment_update

		end	

		def settings_tax

		end


		  private

			def seller_params
			  params.require(:seller).permit(:first_name, :last_name, :email, :password,
			                               :password_confirmation)
			end

		  	def set_current_seller
		    	return unless session[:seller_id]
		    	@current_seller ||= Seller.find(session[:seller_id])
		  	end

			def require_login
			    unless seller_logged_in?
			      flash[:error] = "You must be logged in to access this section"
			      redirect_to seller_login_path # halts request cycle
			    end
			end

			def product_params
			    params.require(:product).permit(:title, :description, :price, :quantity, {images: []}, {files: []}, {category_ids: []})
			end

			def set_current_product
				return unless params[:id]
				@product ||= Product.find(params[:id])
			end
	end
end