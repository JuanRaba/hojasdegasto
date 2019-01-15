class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :expenses, dependent: :destroy
  has_many :asociations, dependent: :destroy
  has_many :expensesSheets, through: :asociations
  has_many :ownedExpensesSheets, class_name: 'ExpensesSheet', foreign_key: :user_id, dependent: :destroy

  def userBalance
    self.expensesSheets.inject(0) {|sum, n| sum + n.userBalance(self) }
  end
  def userSpent
    self.expensesSheets.inject(0) {|sum, n| sum + n.userSpent(self) }
  end
  def show_name
    self.name.present? ? self.name : self.email.split('@').first
  end
end
