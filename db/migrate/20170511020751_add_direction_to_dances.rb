class AddDirectionToDances < ActiveRecord::Migration[5.0]
  def change
    add_column :dances, :direction, :boolean, null: false, default: false
  end
end
