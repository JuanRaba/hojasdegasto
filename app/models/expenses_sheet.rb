class ExpensesSheet < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :expenses, dependent: :destroy
  has_many :asociations, dependent: :destroy
  has_many :users, through: :asociations #and_belongs_to?? TODO

  validates :name, presence: { message: "must be given please" }

  def asociationLevel
    self.asociations.count()
  end
  def totalUnpaid
    self.expenses.where(user: nil).pluck("amount").sum()
  end
  def totalSpent
    self.expenses.pluck("amount").sum()
  end
  def userSpent(user)
    self.expenses.where(user: user).pluck("amount").sum()
  end

  def userBalance(user)
    # gaste 50 somos 2 y el otro puso:
    # 0: 50 - (50/2) = +25
    # 50: 50 - (100/2) = 0
    # 100: 50 - (150/2) = -25
    userSpent(user) - (totalSpent / asociationLevel.to_f)
  end
end
