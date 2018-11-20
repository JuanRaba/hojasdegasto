class AsociationsController < ApplicationController
  def create
    @expensesSheet = ExpensesSheet.find(params[:expenses_sheet_id])
    @newAsociation = Asociation.new(
      user: User.find_by_email(params[:asociation][:email]),
      expensesSheet: @expensesSheet
    )

    respond_to do |format|
      if @newAsociation.save
        format.html { redirect_to @expensesSheet, notice: 'newAsociation was successfully created.' }
        format.json { render :show, status: :created, location: @expensesSheet }
      else
        #fix this
        format.html { render :new }
        format.json { render json: @newAsociation.errors, status: :unprocessable_entity }
      end
    end
  end
end
