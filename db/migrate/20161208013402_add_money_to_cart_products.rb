class AddMoneyToCartProducts < ActiveRecord::Migration[6.0]
  def change
  	add_money :rails_marketplace_cart_products, :price
  	add_money :rails_marketplace_order_products, :price
  end
end
