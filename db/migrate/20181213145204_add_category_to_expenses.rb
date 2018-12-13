class AddCategoryToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_reference :expenses, :category, foreign_key: true
  end
end
