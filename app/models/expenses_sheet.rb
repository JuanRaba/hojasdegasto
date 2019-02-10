class ExpensesSheet < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :expenses, dependent: :destroy
  has_many :asociations, dependent: :destroy
  has_many :users, through: :asociations #and_belongs_to?? TODO
  has_many :categories, through: :expenses

  validates :name, presence: { message: "must be given please" }

  def asociationLevel
    self.asociations.count()
  end
  def totalUnpaid
    self.expenses.where(user: nil).pluck("amount").sum()
  end
  def expensesCountToClaim
    self.expenses.where(user: nil).count()
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

    # WARNING this trigers 3 queries
    puts '!!userBalance trigers 3 queries'
    userSpent(user) - (totalSpent / asociationLevel.to_f)
  end

  def userSummary(user, asociationLevelTaken, userSpentTaken)
    summary = Hash.new
    summary[:totalSpent] = totalSpent
    summary[:userBalance] = userSpentTaken - (summary[:totalSpent] / asociationLevelTaken.to_f)
    summary
  end

  def is_user_asociated(user)
    self.users.where(id: user.id).present?  
  end
end
