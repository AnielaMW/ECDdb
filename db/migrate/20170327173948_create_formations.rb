class CreateFormations < ActiveRecord::Migration[5.0]
  def change
    create_table :formations do |t|
      t.string :name, null: false
      t.string :description, null: false
    end
  end
end
