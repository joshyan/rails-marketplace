class AddReferenceOrderCustomers < ActiveRecord::Migration[6.0]
  def change
  	add_reference :rails_marketplace_orders, :customer, index: true
  end
end
