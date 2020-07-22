class CreateOrderProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :rails_marketplace_order_products do |t|
    	t.belongs_to :product, :index => true
      	t.belongs_to :order, :index => true
        t.belongs_to :seller, :index => true
      	t.integer :quantity
      	t.string :price

      t.timestamps null: false
    end
  end
end
