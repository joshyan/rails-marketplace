class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :rails_marketplace_admins do |t|
    	t.string :name
    	t.string :email
    	t.string :password
        t.string :password_digest

    	t.timestamps null: false
    end
  end
end
