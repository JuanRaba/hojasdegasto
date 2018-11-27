class AsociationsController < ApplicationController
  authorize_resource

  def create
    @expensesSheet = ExpensesSheet.find(params[:expenses_sheet_id])
    
    if @expensesSheet.owner == current_user
      @newAsociation = Asociation.new(
        user: User.find_by_email(params[:asociation][:email]),
        expensesSheet: @expensesSheet
      )
    else
      redirect_to root_path, alert: "GTFO you are not owner"
      return
    end

    respond_to do |format|
      if @newAsociation.save
        format.html { redirect_to @expensesSheet, notice: 'newAsociation was successfully created.' }
        format.json { render :show, status: :created, location: @expensesSheet }
      else
        # improve error parsing this
        # @newAsociation.errors.details == {:user_id=>[{:error=>:taken, :value=>2}]}
        format.html { redirect_to @expensesSheet, alert: "newAsociation was not created. #{@newAsociation.errors.messages}" }
        format.json { render json: @newAsociation.errors, status: :unprocessable_entity }
      end
    end
  end
end
