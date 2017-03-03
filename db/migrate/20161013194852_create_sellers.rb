class CreateSellers < ActiveRecord::Migration
  def change
    create_table :rails_marketplace_sellers do |t|
    	t.string :email
    	t.string :password
        t.string :password_digest
    	t.string :first_name
    	t.string :last_name

    	t.timestamps null: false
    end
  end
end
