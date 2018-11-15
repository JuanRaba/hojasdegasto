class Asociation < ApplicationRecord
  belongs_to :user
  belongs_to :expensesSheet
end
