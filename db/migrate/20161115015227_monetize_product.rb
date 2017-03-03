class MonetizeProduct < ActiveRecord::Migration
  def change
  	add_money :rails_marketplace_products, :price
  end
end
