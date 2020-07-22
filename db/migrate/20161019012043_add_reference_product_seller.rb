class AddReferenceProductSeller < ActiveRecord::Migration[6.0]
  def change
  	add_reference :rails_marketplace_products, :seller, index: true
  end
end
