RailsMarketplace::Engine.routes.draw do
  root 'catalog#index'

  get 'sellercentral' => 'seller#login_form', as: :seller_login
  post 'sellercentral' => 'seller#login'
  get 'sellercentral/signup' => 'seller#signup_form', as: :seller_signup
  post 'sellercentral/signup' => 'seller#signup'
  get 'sellercentral/logout' => 'seller#logout', as: :seller_logout
  get 'sellercentral/dashboard' => 'seller#dashboard', as: :seller_dashboard
  get 'sellercentral/products' => 'seller#products', as: :seller_products
  get 'sellercentral/products/new' => 'seller#add_product', as: :seller_add_product
  post 'sellercentral/products/new' => 'seller#create_product', as: :seller_create_product
  get 'sellercentral/products/:id' => 'seller#edit_product', as: :seller_edit_product
  post 'sellercentral/products/:id' => 'seller#update_product', as: :seller_update_product
  delete 'sellercentral/products/:id' => 'seller#delete_product', as: :seller_delete_product
  get 'sellercentral/add_bulk_products' => 'seller#add_bulk_products', as: :seller_add_bulk_products
  get 'sellercentral/orders' => 'seller#orders', as: :seller_orders
  get 'sellercentral/orders/:order_id' => 'seller#order_details', as: :seller_order_details
  get 'sellercentral/settings/general' => 'seller#settings_general', as: :seller_settings_general
  post 'sellercentral/settings/general' => 'seller#settings_general_update', as: :seller_settings_general_update
  get 'sellercentral/settings/shipping' => 'seller#settings_shipping', as: :seller_settings_shipping
  post 'sellercentral/settings/shipping' => 'seller#settings_shipping_update', as: :seller_settings_shipping_update
  get 'sellercentral/settings/payment' => 'seller#settings_payment', as: :seller_settings_payment
  post 'sellercentral/settings/payment' => 'seller#settings_payment_update', as: :seller_settings_payment_update
  get 'sellercentral/settings/tax' => 'seller#settings_tax', as: :seller_settings_tax
  

  get 'admin' => 'admin#login_form', as: :admin_login
  post 'admin' => 'admin#login'
  get 'admin/signup' => 'admin#signup_form', as: :admin_signup
  post 'admin/signup' => 'admin#signup'
  get 'admin/logout' => 'admin#logout', as: :admin_logout
  get 'admin/dashboard' => 'admin#dashboard', as: :admin_dashboard
  get 'admin/sellers' => 'admin#sellers', as: :admin_sellers
  get 'admin/seller/:id/products' => 'admin#seller_products', as: :admin_seller_products  
  get 'admin/categories' => 'admin#categories', as: :admin_categories
  get 'admin/add_category' => 'admin#add_category', as: :admin_add_category
  post 'admin/create_category' => 'admin#create_category', as: :admin_create_category
  get 'admin/edit_category' => 'admin#edit_category', as: :admin_edit_category
  post 'admin/update_category' => 'admin#update_category', as: :admin_update_category
  get 'admin/products' => 'admin#products', as: :admin_products
  get 'admin/category/:id/products' => 'admin#category_products', as: :admin_category_products
  get 'admin/settings_form' => 'admin#settings_form', as: :admin_settings_form
  post 'admin/settings' => 'admin#settings', as: :admin_settings


  get 'catalog/:name' => 'catalog#category_products', as: :category_products
  get 'product/:title' => 'catalog#product_detail', as: :product_detail
  post 'cart/add' => 'catalog#add_to_cart', as: :add_to_cart
  post 'purchase' => 'catalog#purchase', as: :purchase
  get 'cart' => 'catalog#cart', as: :cart
  put 'cart/update' => 'catalog#cart_update', as: :cart_update
  get 'cart/delete/:product_id' => 'catalog#cart_delete', as: :cart_delete
  get 'checkout' => 'catalog#checkout', as: :checkout
  post 'charge' => 'catalog#charge', as: :charge
  get 'checkout/success' => 'catalog#checkout_success', as: :checkout_success

end
