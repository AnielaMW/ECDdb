class RemoveDirectionFromDances < ActiveRecord::Migration[5.0]
  def change
    remove_column :dances, :direction
  end
end
