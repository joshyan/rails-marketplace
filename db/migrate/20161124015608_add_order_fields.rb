class AddOrderFields < ActiveRecord::Migration[6.0]
  def change
  	add_column :rails_marketplace_orders, :email, :string
  	add_column :rails_marketplace_orders, :fullname, :string
  	add_column :rails_marketplace_orders, :address1, :string
  	add_column :rails_marketplace_orders, :address2, :string
  	add_column :rails_marketplace_orders, :city, :string
  	add_column :rails_marketplace_orders, :state, :string
  	add_column :rails_marketplace_orders, :zip, :string
  	add_column :rails_marketplace_orders, :country, :string
  	add_column :rails_marketplace_orders, :phone, :string
  	add_column :rails_marketplace_orders, :shipping_method, :string
  	add_column :rails_marketplace_orders, :is_gift, :boolean
  	add_column :rails_marketplace_orders, :gift_message, :text
  end
end
