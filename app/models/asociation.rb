class Asociation < ApplicationRecord
  belongs_to :user
  belongs_to :expensesSheet, class_name: 'ExpensesSheet', foreign_key: :expenses_sheet_id

  validates :user_id, uniqueness: { scope: [:expenses_sheet_id]}
end
