class AddStripeToAdminSettings < ActiveRecord::Migration[6.0]
  def change
  	remove_column :rails_marketplace_admins, :stripe_publishable_key, :string
  	remove_column :rails_marketplace_admins, :stripe_secret_key, :string

  	add_column :rails_marketplace_admin_settings, :stripe_publishable_key, :string
  	add_column :rails_marketplace_admin_settings, :stripe_secret_key, :string
  end
end
