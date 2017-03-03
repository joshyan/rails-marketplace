class AddMoneyToCartProducts < ActiveRecord::Migration
  def change
  	add_money :rails_marketplace_cart_products, :price
  	add_money :rails_marketplace_order_products, :price
  end
end
