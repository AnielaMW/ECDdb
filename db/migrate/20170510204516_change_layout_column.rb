class ChangeLayoutColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :dance_directions, :layout, :position
    change_column :dance_directions, :direction, :text
  end
end
