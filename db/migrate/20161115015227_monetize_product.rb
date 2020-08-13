class MonetizeProduct < ActiveRecord::Migration[6.0]
  def change
  	add_monetize :rails_marketplace_products, :price
  end
end
