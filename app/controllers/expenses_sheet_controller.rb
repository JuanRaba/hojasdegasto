class ExpensesSheetController < ApplicationController
  before_action :authenticate_user!
  authorize_resource
  def index
    @expensesSheets = current_user.expensesSheets
    @newExpensesSheet = ExpensesSheet.new
  end

  def show
    @expensesSheet = ExpensesSheet.find(params[:id])
    @expenses = @expensesSheet.expenses
    @newExpense = Expense.new
    @newAsociation = Asociation.new
  end

  def create
    @newExpensesSheet = current_user.expensesSheets.build(owner: current_user, name: params[:expenses_sheet][:name])

    respond_to do |format|
      if @newExpensesSheet.save
        Asociation.create!(
          user: current_user,
          expensesSheet: @newExpensesSheet
        )
        format.html { redirect_to root_path, notice: 'newExpensesSheet was successfully created.' }
        format.json { render :show, status: :created, location: @newExpensesSheet }
      else
        format.html { redirect_to root_path, alert: "newExpensesSheet was not created. #{@newExpensesSheet.errors.messages}" }
        format.json { render json: @newExpensesSheet.errors, status: :unprocessable_entity }
      end
    end
  end

end
