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
        # improve error parsing this
        # @newAsociation.errors.details == {:user_id=>[{:error=>:taken, :value=>2}]}
        format.html { redirect_to @expensesSheet, alert: "newAsociation was not created. #{@newAsociation.errors,messages}" }
        format.json { render json: @newAsociation.errors, status: :unprocessable_entity }
      end
    end
  end
end
