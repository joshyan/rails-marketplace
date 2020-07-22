class AddPriceToCartProducts < ActiveRecord::Migration[6.0]
  def change
  	add_column :rails_marketplace_cart_products, :price, :decimal, :precision => 8, :scale => 2
  	change_column :rails_marketplace_order_products, :price, :decimal, :precision => 8, :scale => 2
  end
end
