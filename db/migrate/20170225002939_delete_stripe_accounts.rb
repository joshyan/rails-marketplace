class DeleteStripeAccounts < ActiveRecord::Migration[6.0]
  def change
  	drop_table :rails_marketplace_stripe_managed_accounts

  	add_column :rails_marketplace_seller_settings, :stripe_publishable_key, :string
  	add_column :rails_marketplace_seller_settings, :stripe_secret_key, :string
  end
end
