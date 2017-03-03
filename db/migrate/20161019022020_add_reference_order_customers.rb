class AddReferenceOrderCustomers < ActiveRecord::Migration
  def change
  	add_reference :rails_marketplace_orders, :customer, index: true
  end
end
