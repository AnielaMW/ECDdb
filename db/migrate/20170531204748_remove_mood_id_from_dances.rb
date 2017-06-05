class RemoveMoodIdFromDances < ActiveRecord::Migration[5.0]
  def change
    remove_column :dances, :mood_id
  end
end
