class AddSlugToCategory < ActiveRecord::Migration
  def change
  	add_column :rails_marketplace_categories, :slug, :string
  	add_index :rails_marketplace_categories, :slug, :unique => true
  end
end
