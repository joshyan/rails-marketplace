class CreateSellerSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :rails_marketplace_seller_settings do |t|
        t.string :store_name
        t.string :store_customer_email

        # t.string :payments

        t.string :shipping_origin_company_name
        t.string :shipping_origin_address1
        t.string :shipping_origin_address2
        t.string :shipping_origin_city
        t.string :shipping_origin_zip
        t.string :shipping_origin_country
        t.string :shipping_origin_state
        t.string :shipping_origin_phone

        t.boolean :shipping_standard_enabled
        t.string :shipping_standard_fee
        t.string :shipping_standard_delivery_date
        t.boolean :shipping_expediate_enabled
        t.string :shipping_expediate_fee
        t.string :shipping_expediate_delivery_date

        # t.string :tax_setting
        t.string :store_status
    end
  end
end
