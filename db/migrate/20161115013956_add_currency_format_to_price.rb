class AddCurrencyFormatToPrice < ActiveRecord::Migration[6.0]
  def change
  	change_column :rails_marketplace_products, :price, :decimal, :precision => 8, :scale => 2
  	remove_column :rails_marketplace_cart_products, :price
  end
end
