class AddMoneyToCartProducts < ActiveRecord::Migration[6.0]
  def change
  	add_monetize :rails_marketplace_cart_products, :price
  	add_monetize :rails_marketplace_order_products, :price
  end
end
