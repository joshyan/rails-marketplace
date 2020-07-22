class AddSellerToOrders < ActiveRecord::Migration[6.0]
  def change
  	add_reference :rails_marketplace_orders, :seller, index: true
  	remove_reference :rails_marketplace_order_products, :seller
  end
end
