class AddForeignKeysToDances < ActiveRecord::Migration[5.0]
  def change
    rename_column :dances, :key, :key_id
    rename_column :dances, :level, :dance_level_id
    rename_column :dances, :mood, :mood_id
    rename_column :dances, :tempo, :tempo_id
  end
end
