class AddNameToExpense < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :name, :string
  end
end
