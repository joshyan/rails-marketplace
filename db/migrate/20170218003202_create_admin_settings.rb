class CreateAdminSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :rails_marketplace_admin_settings do |t|
    	t.string :timezone
        t.string :unit_system
        t.string :weight_unit
        t.string :order_prefix
        t.string :order_suffix

        t.string :checkout_customer_account
        t.string :checkout_req_last_name
        t.string :checkout_req_company_name
        t.string :checkout_req_address2
        t.string :checkout_req_phone

        t.boolean :checkout_same_shipping_billing
        t.string :checkout_agree_promotion

        t.text :refund_policy
        t.text :privacy_policy
        t.text :terms_of_service
    end
  end
end
