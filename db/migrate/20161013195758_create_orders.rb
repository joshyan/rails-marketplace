class CreateOrders < ActiveRecord::Migration
  def change
    create_table :rails_marketplace_orders do |t|

      t.timestamps null: false
    end
  end
end
