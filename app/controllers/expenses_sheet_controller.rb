class ExpensesSheetController < ApplicationController
  before_action :authenticate_user!
  def index
    @expensesSheets = current_user.expensesSheets
  end

  def show
    @expensesSheet = ExpensesSheet.find(params[:id])
    @expenses = @expensesSheet.expenses
  end
end
