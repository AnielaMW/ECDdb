class CreateMeters < ActiveRecord::Migration[5.0]
  def change
    create_table :meters do |t|
      t.string :name, null: false
      t.string :description, null: false
    end
  end
end
