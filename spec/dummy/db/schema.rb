# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170225003252) do

  create_table "rails_marketplace_admin_settings", force: :cascade do |t|
    t.string  "timezone"
    t.string  "unit_system"
    t.string  "weight_unit"
    t.string  "order_prefix"
    t.string  "order_suffix"
    t.string  "checkout_customer_account"
    t.string  "checkout_req_last_name"
    t.string  "checkout_req_company_name"
    t.string  "checkout_req_address2"
    t.string  "checkout_req_phone"
    t.boolean "checkout_same_shipping_billing"
    t.string  "checkout_agree_promotion"
    t.text    "refund_policy"
    t.text    "privacy_policy"
    t.text    "terms_of_service"
    t.string  "stripe_publishable_key"
    t.string  "stripe_secret_key"
    t.string  "admin_id"
  end

  create_table "rails_marketplace_admins", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "rails_marketplace_cart_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.integer  "quantity"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.decimal  "price",      precision: 8, scale: 2
  end

  add_index "rails_marketplace_cart_products", ["cart_id"], name: "index_rails_marketplace_cart_products_on_cart_id"
  add_index "rails_marketplace_cart_products", ["product_id"], name: "index_rails_marketplace_cart_products_on_product_id"

  create_table "rails_marketplace_carts", force: :cascade do |t|
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "rails_marketplace_carts", ["customer_id"], name: "index_rails_marketplace_carts_on_customer_id"

  create_table "rails_marketplace_categories", force: :cascade do |t|
    t.string  "name"
    t.text    "description"
    t.string  "image"
    t.integer "parent_id"
    t.integer "depth",       default: 0, null: false
    t.string  "slug"
  end

  add_index "rails_marketplace_categories", ["parent_id"], name: "index_rails_marketplace_categories_on_parent_id"
  add_index "rails_marketplace_categories", ["slug"], name: "index_rails_marketplace_categories_on_slug", unique: true

  create_table "rails_marketplace_category_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "rails_marketplace_category_products", ["category_id"], name: "index_rails_marketplace_category_products_on_category_id"
  add_index "rails_marketplace_category_products", ["product_id"], name: "index_rails_marketplace_category_products_on_product_id"

  create_table "rails_marketplace_customers", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "phone_number"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "rails_marketplace_friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "rails_marketplace_friendly_id_slugs", ["sluggable_id"], name: "index_rails_marketplace_friendly_id_slugs_on_sluggable_id"

  create_table "rails_marketplace_order_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "quantity"
    t.decimal  "price",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "rails_marketplace_order_products", ["order_id"], name: "index_rails_marketplace_order_products_on_order_id"
  add_index "rails_marketplace_order_products", ["product_id"], name: "index_rails_marketplace_order_products_on_product_id"

  create_table "rails_marketplace_orders", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "customer_id"
    t.string   "email"
    t.string   "fullname"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "phone"
    t.string   "shipping_method"
    t.boolean  "is_gift"
    t.text     "gift_message"
    t.integer  "seller_id"
  end

  add_index "rails_marketplace_orders", ["customer_id"], name: "index_rails_marketplace_orders_on_customer_id"
  add_index "rails_marketplace_orders", ["seller_id"], name: "index_rails_marketplace_orders_on_seller_id"

  create_table "rails_marketplace_products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "images"
    t.decimal  "price",       precision: 8, scale: 2
    t.integer  "quantity"
    t.text     "files"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "seller_id"
    t.string   "slug"
  end

  add_index "rails_marketplace_products", ["price"], name: "index_rails_marketplace_products_on_price"
  add_index "rails_marketplace_products", ["seller_id"], name: "index_rails_marketplace_products_on_seller_id"
  add_index "rails_marketplace_products", ["slug"], name: "index_rails_marketplace_products_on_slug", unique: true
  add_index "rails_marketplace_products", ["title"], name: "index_rails_marketplace_products_on_title"

  create_table "rails_marketplace_seller_settings", force: :cascade do |t|
    t.string  "store_name"
    t.string  "store_customer_email"
    t.string  "shipping_origin_company_name"
    t.string  "shipping_origin_address1"
    t.string  "shipping_origin_address2"
    t.string  "shipping_origin_city"
    t.string  "shipping_origin_zip"
    t.string  "shipping_origin_country"
    t.string  "shipping_origin_state"
    t.string  "shipping_origin_phone"
    t.boolean "shipping_standard_enabled"
    t.string  "shipping_standard_fee"
    t.string  "shipping_standard_delivery_date"
    t.boolean "shipping_expediate_enabled"
    t.string  "shipping_expediate_fee"
    t.string  "shipping_expediate_delivery_date"
    t.string  "store_status"
    t.string  "seller_id"
    t.string  "stripe_publishable_key"
    t.string  "stripe_secret_key"
    t.string  "stripe_account_id"
  end

  create_table "rails_marketplace_sellers", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
