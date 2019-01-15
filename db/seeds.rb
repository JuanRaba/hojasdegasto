# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Expense.destroy_all
#Asociation.destroy_all
#ExpensesSheet.destroy_all
u = User.first
e = ExpensesSheet.create!(
  name: 'hoja1',
  owner: u
  )
c = Category.create!(
  name: '---'
  )
a = Asociation.create!(
  user: u,
  expensesSheet: e
  )
10.times do |j|
  gasto = e.expenses.build(
    amount: j,
    user: u,
    expensesSheet: e,
    category: c,
    start: Time.now
  )
  gasto.save!
end


#AdminUser.create!(email: 'admin@rabanillo.com', password: 'admin1234', password_confirmation: 'admin1234') if Rails.env.development?
