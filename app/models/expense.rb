class Expense < ApplicationRecord
  belongs_to :user, optional: true 
  belongs_to :expensesSheet, class_name: 'ExpensesSheet', foreign_key: :expenses_sheet_id
  belongs_to :category

  def show_name
    self.name.present? ? self.name : self.id
  end

  def title
    name
  end

  def to_json(options = {})
    options[:except] = [:start2, :title]
    options[:methods] = [:start, :title]
    byebug
    super(options)
  end

  def self.start_secure?(new_date)
    DateTime.parse new_date rescue nil
  end
end
