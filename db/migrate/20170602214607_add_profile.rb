class AddProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string, unique: true
    add_column :users, :privacy1, :boolean, default: false
    add_column :users, :location, :string
    add_column :users, :privacy2, :boolean, default: false
    add_column :users, :dancer, :boolean, default: false
    add_column :users, :caller, :boolean, default: false
    add_column :users, :musician, :boolean, default: false
    add_column :users, :band, :boolean, default: false
    add_column :users, :about, :text
  end
end
