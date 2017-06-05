class AddColumnToDances < ActiveRecord::Migration[5.0]
  def change
    rename_column :dances, :author, :choreographer
    add_column :dances, :level, :integer
    add_column :dances, :tempo, :integer
    add_column :dances, :key, :integer
  end
end
