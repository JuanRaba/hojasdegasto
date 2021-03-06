class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.references :user, foreign_key: true
      t.references :expenses_sheet, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
