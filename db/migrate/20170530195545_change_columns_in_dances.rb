class ChangeColumnsInDances < ActiveRecord::Migration[5.0]
  def change
    add_column :dances, :mood, :integer
  end
end
