class CreateDances < ActiveRecord::Migration[5.0]
  def change
    create_table :dances do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :author
      t.integer :year
      t.string :publication
      t.integer :formation_id, null: false
      t.integer :meter_id, null: false
      t.string :direction, null: false
    end
  end
end
