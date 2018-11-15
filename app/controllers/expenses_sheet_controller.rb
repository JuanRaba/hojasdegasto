class ExpensesSheetController < ApplicationController
  before_action :authenticate_user!
  def index
    @expensesSheets = current_user.expensesSheets
    @newExpensesSheet = current_user.expensesSheets.build(owner: current_user)
  end

  def show
    @expensesSheet = ExpensesSheet.find(params[:id])
    @expenses = @expensesSheet.expenses
  end

  def create
    @newExpensesSheet = current_user.expensesSheets.build(owner: current_user)

    respond_to do |format|
      if @newExpensesSheet.save
        Asociation.create!(
          user: current_user,
          expensesSheet: @newExpensesSheet
        )
        format.html { redirect_to @newExpensesSheet, notice: 'newExpensesSheet was successfully created.' }
        format.json { render :show, status: :created, location: @newExpensesSheet }
      else
        format.html { render :new }
        format.json { render json: @newExpensesSheet.errors, status: :unprocessable_entity }
      end
    end
  end

end
