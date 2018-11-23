class AddNameToExpensesSheet < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses_sheets, :name, :string
  end
end
