class RenameDirectionCompleteInDances < ActiveRecord::Migration[5.0]
  def change
    rename_column :dances, :direction, :complete
  end
end
