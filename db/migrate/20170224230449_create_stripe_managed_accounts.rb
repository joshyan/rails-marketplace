class CreateStripeManagedAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :rails_marketplace_stripe_managed_accounts do |t|
    	t.string :account_id
    	t.string :secret_key
    	t.string :public_key
    end
  end
end
