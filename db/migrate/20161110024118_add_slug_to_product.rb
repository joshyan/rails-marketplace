class AddSlugToProduct < ActiveRecord::Migration[6.0]
  def change
  	add_column :rails_marketplace_products, :slug, :string
  	add_index :rails_marketplace_products, :slug, :unique => true
  end
end
