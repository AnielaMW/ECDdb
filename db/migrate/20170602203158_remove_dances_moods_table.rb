class RemoveDancesMoodsTable < ActiveRecord::Migration[5.0]
  def change
    drop_join_table :dances, :moods
  end
end
