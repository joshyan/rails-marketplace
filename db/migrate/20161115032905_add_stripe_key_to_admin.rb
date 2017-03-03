class AddStripeKeyToAdmin < ActiveRecord::Migration
  def change
  	add_column :rails_marketplace_admins, :stripe_publishable_key, :string
  	add_column :rails_marketplace_admins, :stripe_secret_key, :string
  end
end
