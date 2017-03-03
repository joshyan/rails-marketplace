class AddReferenceProductSeller < ActiveRecord::Migration
  def change
  	add_reference :rails_marketplace_products, :seller, index: true
  end
end
