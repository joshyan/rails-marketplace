class CreateCarts < ActiveRecord::Migration
  def change
    create_table :rails_marketplace_carts do |t|
      t.belongs_to :customer, :index => true
      t.timestamps null: false
    end
  end
end
