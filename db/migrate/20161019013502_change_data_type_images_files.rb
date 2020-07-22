class ChangeDataTypeImagesFiles < ActiveRecord::Migration[6.0]
  def change
  	change_column :rails_marketplace_products, :images, :text
  	change_column :rails_marketplace_products, :files, :text
  end
end
