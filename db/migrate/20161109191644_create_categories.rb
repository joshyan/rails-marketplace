class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :rails_marketplace_categories do |t|
      t.string :name
      t.text :description
      t.string :image
      t.integer :parent_id, :null => true, :index => true
      t.integer :depth, :null => false, :default => 0
    end
  end

  def self.down
    drop_table :rails_marketplace_categories
  end
end
