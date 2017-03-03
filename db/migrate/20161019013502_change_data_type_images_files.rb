class ChangeDataTypeImagesFiles < ActiveRecord::Migration
  def change
  	change_column :rails_marketplace_products, :images, :text
  	change_column :rails_marketplace_products, :files, :text
  end
end
