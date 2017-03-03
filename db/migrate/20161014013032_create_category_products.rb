class CreateCategoryProducts < ActiveRecord::Migration
  def change
    create_table :rails_marketplace_category_products do |t|
      t.belongs_to :product, :index => true
      t.belongs_to :category, :index => true
      	
      t.timestamps null: false
    end
  end
end
