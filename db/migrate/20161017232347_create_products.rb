class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :rails_marketplace_products do |t|
    	t.string :title, :index => true
    	t.text :description
    	t.string :images
    	t.decimal :price, :precision => 8, :scale => 2, :index => true
        t.integer :quantity
    	t.string :files

    	t.timestamps null: false
    end
  end
end
