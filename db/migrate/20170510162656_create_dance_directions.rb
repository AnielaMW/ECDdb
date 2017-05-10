class CreateDanceDirections < ActiveRecord::Migration[5.0]
  def change
    create_table :dance_directions do |t|
      t.integer :dance_id, null: false
      t.integer :sequence, null: false
      t.string :mark
      t.string :measure
      t.string :direction, null: false
      t.string :layout
    end
  end
end
