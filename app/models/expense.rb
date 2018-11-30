class Expense < ApplicationRecord
  belongs_to :user, optional: true 
  belongs_to :expensesSheet, class_name: 'ExpensesSheet', foreign_key: :expenses_sheet_id

  def show_name
    self.name.present? ? self.name : self.id
  end
end
