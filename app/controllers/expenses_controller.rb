class ExpensesController < ApplicationController
  def create
    @newExpense = current_user.expenses.build(
      amount: params[:amount].to_i,
      name: params[:name],
      expenses_sheet_id: params[:expenses_sheet_id]
      )
    respond_to do |format|
      if @newExpense.save
        format.html { redirect_to expenses_sheet_url(@newExpense.expensesSheet), notice: 'newExpense was successfully created.' }
        format.json { render :show, status: :created, location: @newExpense }
      else
        format.html { redirect_to expenses_sheet_url(@newExpense.expensesSheet), notice: "newExpense was not created.#{@newExpense.errors.messages}" }
        format.json { render json: @newExpense.errors, status: :unprocessable_entity }
      end
    end
  end
end
