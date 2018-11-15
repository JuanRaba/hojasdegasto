class ExpensesSheet < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :expenses
  has_many :users, through: :asociations
end
