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
      @expenses_calendar << {"title"=>"$#{e.amount} #{e.name}", "start"=>e.start, "url"=>edit_expense_path(e) }
    end

  end

  def show
    authorize! :read, @expensesSheet
    @expenses = @expensesSheet.expenses.order("created_at DESC")
    # graficDoughnut
    @expenses_by_category = Hash.new
    @expenses.preload(:category).each do |e|
      # SELECT category, sum(amount) FROM @expenses GROUP BY Category
      if @expenses_by_category[e.category.name] == nil
        @expenses_by_category[e.category.name] = e.amount
      else
        @expenses_by_category[e.category.name] += e.amount
      end
    end
    # graficPie
    @expenses_by_asociation = Hash.new
    @expensesSheet.asociations.preload(:user).each do |a|
      @expenses_by_asociation[a.user.show_name] = @expensesSheet.userSpent(a.user)
    end 
    # expenses form
    @newExpense = Expense.new
    @categories = Category.all
    # asociation form
    @newAsociation = Asociation.new
    respond_to do |format|
      format.html
      format.csv { send_data @expenses.to_csv, filename: "gastos-#{@expensesSheet.name}-#{Date.today}.csv" }
    end
  end

  def edit
    # not void, remember set_history => @expensesSheet = ExpensesSheet.find(params[:id])
  end

  def update
    @expensesSheet.name = params[:expenses_sheet][:name]

    respond_to do |format|
      if @expensesSheet.save
        format.html { redirect_to expenses_sheet_index_path, notice: 'expensesSheet name was successfully changed.' }
        format.json { render :show, status: :created, location: @expensesSheet }
      else
        format.html { redirect_to expenses_sheet_index_path, alert: "newExpensesSheet name was not changed. #{@expensesSheet.errors.full_messages}" }
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
        format.html { redirect_to expenses_sheet_index_path, notice: 'newExpensesSheet was successfully created.' }
        format.json { render :show, status: :created, location: @newExpensesSheet }
      else   
        format.html { redirect_to expenses_sheet_index_path, alert: "newExpensesSheet was not created. #{@newExpensesSheet.errors.full_messages}" }
        format.json { render json: @newExpensesSheet.errors, status: :unprocessable_entity } 
      end
    end
  end

  def destroy
    authorize! :destroy, @expensesSheet
    @expensesSheet.destroy
    respond_to do |format|
      format.html { redirect_to expenses_sheet_index_path, notice: 'ExpensesSheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_expensesSheet
    @expensesSheet = ExpensesSheet.find(params[:id])
  end
end
