class AddFieldToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :start, :datetime
  end
end
