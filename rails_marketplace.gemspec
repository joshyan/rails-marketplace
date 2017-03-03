$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_marketplace/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  # s.add_dependency 'carrierwave', '~> 1.0'
  # s.add_dependency 'bootstrap-wysihtml5-rails'
  # s.add_dependency 'mini_magick'
  # s.add_dependency 'acts_as_tree', '2.6.1'
  # s.add_dependency 'friendly_id', '~> 5.1.0'
  # s.add_dependency 'money-rails'
  # s.add_dependency 'stripe'
  s.add_dependency 'bcrypt-ruby', '3.1.2'
  s.name        = "rails_marketplace"
  s.version     = RailsMarketplace::VERSION
  s.authors     = ["Josh Yan"]
  s.email       = ["joshyansmile@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RailsMarketplace."
  s.description = "TODO: Description of RailsMarketplace."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
