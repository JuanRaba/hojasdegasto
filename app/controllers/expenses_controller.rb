class ExpensesController < ApplicationController
  def create
    @newExpense = current_user.expenses.build(
      amount: params[:amount],
      expenses_sheet_id: params[:expenses_sheet_id]
      )
    respond_to do |format|
      if @newExpense.save
        format.html { redirect_to expenses_sheet_url(@newExpense.expensesSheet), notice: 'newExpensesSheet was successfully created.' }
        format.json { render :show, status: :created, location: @newExpense }
      else
        format.html { render :new }
        format.json { render json: @newExpense.errors, status: :unprocessable_entity }
      end
    end
  end
end
