class AddDanceMoods < ActiveRecord::Migration[5.0]
  def change
    create_join_table :dances, :moods
  end
end
