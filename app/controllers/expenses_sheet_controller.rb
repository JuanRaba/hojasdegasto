class ExpensesSheetController < ApplicationController

  before_action :set_expensesSheet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  authorize_resource
  def index
    @expensesSheets = current_user.expensesSheets
    @newExpensesSheet = ExpensesSheet.new
  end

  def fullcalendar
    @expensesSheet = ExpensesSheet.find(params[:expenses_sheet_id])
    @expenses = @expensesSheet.expenses
    @expenses_calendar = []
    @expenses.each do |e|
      @expenses_calendar << {"title"=>e.name, "start"=>e.start}
    end

  end

  def show
    authorize! :read, @expensesSheet
    @expenses = @expensesSheet.expenses.order("created_at DESC")
    # graph
    @expenses_by_category = Hash.new
    @expenses.each do |e|
      if @expenses_by_category[e.category.name] == nil
        @expenses_by_category[e.category.name] = e.amount
      else
        @expenses_by_category[e.category.name] += e.amount
      end
    end
    # expenses form
    @newExpense = Expense.new
    @categories = Category.all
    # asociation form
    @newAsociation = Asociation.new
  end

  def edit
    # not void, remember set_history => @expensesSheet = ExpensesSheet.find(params[:id])
  end

  def update
    @expensesSheet.name = params[:expenses_sheet][:name]

    respond_to do |format|
      if @expensesSheet.save
        format.html { redirect_to root_path, notice: 'expensesSheet name was successfully changed.' }
        format.json { render :show, status: :created, location: @expensesSheet }
      else
        format.html { redirect_to root_path, alert: "newExpensesSheet name was not changed. #{@expensesSheet.errors.messages}" }
        format.json { render json: @expensesSheet.errors, status: :unprocessable_entity }
      end
    end
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


  def destroy
    authorize! :destroy, @expensesSheet
    @expensesSheet.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'ExpensesSheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_expensesSheet
    @expensesSheet = ExpensesSheet.find(params[:id])
  end
end
