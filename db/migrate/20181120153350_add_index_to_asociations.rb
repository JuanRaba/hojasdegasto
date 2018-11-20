class AddIndexToAsociations < ActiveRecord::Migration[5.2]
  def change
    add_index :asociations, ["user_id", "expenses_sheet_id"], :unique => true
  end
end
