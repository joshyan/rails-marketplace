# Rails Marketplace

Rails Marketplace is a project to build an ecommerce marketplace engine.

## Installation Guideline

### Add to current project or create new project: rails new --project

### Step 1: Add related gem files and install
```
a. add to Gemfile
gem 'rails_marketplace'

b. bundle install
```


### Step 2: Migration database from rails_marketplace and install
```
a. rake rails_marketplace:install:migrations
b. rake db:migrate
```


### Step 3: create product image uploader
```
a. rails generate uploader ProductImages
b. add to app/uploaders/product_images_uploader.rb

  include CarrierWave::MiniMagick

  version :large do
    process resize_to_fit: [350, 500]
  end

  version :small do
    process resize_to_fit: [130, 160]
  end

  version :thumb do
    process resize_and_pad: [80, 80, "#ffffff"]
  end
```

### Step 4: Precompile related css and js
```
a. add to `app/assets/config/manifest.js`
//= link rails_marketplace/application.css
//= link rails_marketplace/application.js 
```


### Step 5: Mount to route and start server
```
a. add to config/routes.rb
mount RailsMarketplace::Engine, at: "/"
b. rails s
c. go to localhost:3000
```
