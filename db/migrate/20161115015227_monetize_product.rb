class MonetizeProduct < ActiveRecord::Migration[6.0]
  def change
  	add_money :rails_marketplace_products, :price
  end
end
