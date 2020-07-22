class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :rails_marketplace_customers do |t|
    	t.string :email
    	t.string :password
    	t.string :phone_number
    	t.string :first_name
    	t.string :last_name

    	t.timestamps null: false
    end
  end
end
