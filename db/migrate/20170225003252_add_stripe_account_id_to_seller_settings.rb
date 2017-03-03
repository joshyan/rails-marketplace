class AddStripeAccountIdToSellerSettings < ActiveRecord::Migration
  def change
  	add_column :rails_marketplace_seller_settings, :stripe_account_id, :string
  end
end
