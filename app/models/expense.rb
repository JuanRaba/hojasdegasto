class Expense < ApplicationRecord
  belongs_to :user, optional: true 
  belongs_to :expensesSheet, class_name: 'ExpensesSheet', foreign_key: :expenses_sheet_id
  belongs_to :category

  def show_name
    self.name.present? ? self.name : self.id
  end  

  def show_category
    self.category.present? ? self.category.name : 'UNASIGNED'
  end

  def show_user
    self.user.present? ? self.user.show_name : 'UNASIGNED'
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

  def self.to_csv
    attributes = %w{ show_name amount show_category start show_user }

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |food|
        csv << attributes.map{ |attr| food.send(attr) }
      end
    end
  end

end
