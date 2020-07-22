class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :rails_marketplace_carts do |t|
      t.belongs_to :customer, :index => true
      t.timestamps null: false
    end
  end
end
