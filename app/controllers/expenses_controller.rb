class ExpensesController < ApplicationController
  def create
    if params[:owner] == '1'
      @newExpense = current_user.expenses.build(
        amount: params[:amount].to_i,
        name: params[:name],
        expenses_sheet_id: params[:expenses_sheet_id]
        )
    else
      @newExpense = Expense.new(
        amount: params[:amount].to_i,
        name: params[:name],
        expenses_sheet_id: params[:expenses_sheet_id]
        )
    end
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

  def claim
    @expense = Expense.find(params[:expense_id])
    @expense.user = current_user
    respond_to do |format|
      if @expense.save
        format.html { redirect_to expenses_sheet_url(@expense.expensesSheet), notice: 'expense was successfully claimed.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { redirect_to expenses_sheet_url(@expense.expensesSheet), notice: "expense was not created.#{@expense.errors.messages}" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end
end
