class AddTimestamps < ActiveRecord::Migration[5.0]
  def change
    add_column :dance_comments, :created_at, :datetime, null: false
    add_column :dance_comments, :updated_at, :datetime, null: false

    add_column :comment_types, :created_at, :datetime, null: false
    add_column :comment_types, :updated_at, :datetime, null: false

    add_column :dances, :created_at, :datetime, null: false
    add_column :dances, :updated_at, :datetime, null: false

    add_column :formations, :created_at, :datetime, null: false
    add_column :formations, :updated_at, :datetime, null: false

    add_column :meters, :created_at, :datetime, null: false
    add_column :meters, :updated_at, :datetime, null: false
  end
end
