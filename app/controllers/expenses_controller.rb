class ExpensesController < ApplicationController
  
  def create
    @newExpense = Expense.new()
    @newExpense.amount = params[:expense][:amount].scan(/[.0-9]/).join().to_i
    @newExpense.name = params[:expense][:name]
    @newExpense.expenses_sheet_id = params[:expenses_sheet_id]
    @newExpense.category_id = params[:category_id]
    @newExpense.user = current_user if params[:expense][:owner] == '1'
      
    authorize! :create, @newExpense
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
    authorize! :claim, @expense
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

  def destroy
    @expense = Expense.find(params[:id])
    authorize! :destroy, @expense
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_sheet_url(params[:expenses_sheet_id]), notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
    @expense = Expense.find(params[:id])
    authorize! :edit, @expense
    @categories = Category.all
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.amount = params[:expense][:amount].scan(/[.0-9]/).join().to_i
    @expense.name = params[:expense][:name]
    @expense.category_id = params[:category_id]
    @expense.user = current_user if params[:expense][:owner] == '1'
      
    authorize! :update, @expense
    respond_to do |format|
      if @expense.save
        format.html { redirect_to expenses_sheet_url(@expense.expensesSheet), notice: 'expense was successfully updated.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { redirect_to expenses_sheet_url(@expense.expensesSheet), notice: "expense was not updated.#{@expense.errors.messages}" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:amount, :name, :owner)
  end
end
