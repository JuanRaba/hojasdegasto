class AsociationsController < ApplicationController
  require 'sendgrid-ruby'
  include SendGrid

  def create
    @expensesSheet = ExpensesSheet.find(params[:expenses_sheet_id])

    @newAsociation = Asociation.new(
      user: User.find_by_email(params[:asociation][:email]),
      expensesSheet: @expensesSheet
    )
    authorize! :create, @newAsociation

    respond_to do |format|
      if @newAsociation.save
        format.html { redirect_to @expensesSheet, notice: 'newAsociation was successfully created.' }
        format.json { render :show, status: :created, location: @expensesSheet }
      else
        alert_message = "newAsociation was not created. #{@newAsociation.errors.full_messages}"
        # improve error parsing this
        # @newAsociation.errors.details == {:user_id=>[{:error=>:taken, :value=>2}]}
        if @newAsociation.errors.messages[:user_id] != ["has already been taken"]
          sendgrid_result = sendmail(params[:asociation][:email])
          alert_message += "A mail was sent to invite, status_code:#{sendgrid_result[0]}, sent_description:#{sendgrid_result[1]}"
        end
        format.html { redirect_to @expensesSheet, alert: alert_message }
        format.json { render json: @newAsociation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def sendmail(to_email)
    from = Email.new(email: current_user.email)
    subject = 'Hello World from Hojas de Gasto!'
    to = Email.new(email: to_email)
    content = Content.new(type: 'text/plain', value: 'Hello, Email! Register to enjoy https://hojasdegasto.herokuapp.com/users/sign_in')
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_HOJASDEGASTO'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    [response.status_code, response.body, response.headers]
  end
end
