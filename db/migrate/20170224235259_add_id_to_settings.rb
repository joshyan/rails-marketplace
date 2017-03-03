class AddIdToSettings < ActiveRecord::Migration
  def change
  	add_column :rails_marketplace_admin_settings, :admin_id, :string
  	add_column :rails_marketplace_seller_settings, :seller_id, :string
  end
end
