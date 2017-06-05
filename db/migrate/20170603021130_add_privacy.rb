class AddPrivacy < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :privacy3, :boolean, default: false
    add_column :users, :privacy4, :boolean, default: false
    add_column :users, :privacy5, :boolean, default: false
    add_column :users, :choreographer, :boolean, default: false
    add_column :users, :composer, :boolean, default: false
  end
end
