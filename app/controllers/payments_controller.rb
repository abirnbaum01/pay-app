class PaymentsController < ApplicationController
  # GET /payments
  # GET /payments.json
  
  
  before_filter :authenticate_user!

  #def correct_user
  #  user = Goal.find(params[:id]).user if params[:id]
  #  redirect_to user_path(current_user) and return unless current_user?(user)
  #end
  #http://stackoverflow.com/questions/6050670/preventing-other-signed-in-users-from-accessing-edit-page?rq=1
  
  def index

    @payments_all = Payment.all
    @payments_current = current_user.payments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payments_all }
      format.json { render json: @payments_current }
    end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
    @payment = current_user.payments.find(params[:id])  #*** THIS WILL GIVE ERROR FOR SHOWING MONEY YOU OWE
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/new
  # GET /payments/new.json
  def new
    if current_user.pay_method == nil  # If user has not yet entered in a payment method (b/c new to the site)
      # @skip_to_new_payment = true
      redirect_to edit_user_mailer_url(current_user), :flash => { notice: 'Before creating a new payment, please let us know how you would like to be paid back' }
      return
    end
    # Use "build" rather than "new" for association current_user.payments

    @payment = current_user.payments.build
    @preview = false

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/1/edit
  def edit
    @payment = current_user.payments.find(params[:id])
  end

  # GET /payments/1/edit ... editing for non-registered users
  def editnr 
    @payment = Payment.find(params[:id])
  end

  # POST /payments
  # POST /payments.json
  def create

    if params[:commit] == "Create" #If create button is pushed
      @payment = current_user.payments.build(params[:payment])
      
      #if payee does not exist as user, then create new user with Token
      unless User.find_by_email(params[:payment][:email].downcase)  
        u = User.new({:email => params[:payment][:email].downcase, :password => nil, :password_confirmation => nil, :not_registered => 1 })
        u.skip_confirmation!
        u.save(:validate => false)  #skip validation
        u.reset_authentication_token!
      end

      respond_to do |format|
        if @payment.save
          
          # Tell the UserMailer to send a welcome Email after save
          UserMailers.welcome_email(@payment).deliver

          format.html { redirect_to payments_url, :flash => { notice: 'First email payment reminder has been sent.' } }
          format.json { render json: @payment, status: :created, location: @payment }
        else
          format.html { render action: "new" }
          format.json { render json: @payment.errors, status: :unprocessable_entity }
        end
      end
    else #if preview button is pushed
      @payment = current_user.payments.build(params[:payment])
      @preview = true
      render :action => "new"
    end
  end

  # PUT /payments/1
  # PUT /payments/1.json
  def update
    @payment = current_user.payments.find(params[:id])

    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to payments_url, :flash => { :success => "Payment was successfully updated." } }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def updatenr
    @payment = Payment.find(params[:id])

    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to payments_url, :flash => { :success => "Payment was successfully updated." } }
        format.json { head :no_content }
        if @payment.paid == "paid"
          UserMailers.paid_email(@payment).deliver
        end
      else
        format.html { render action: "editnr" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment = current_user.payments.find(params[:id])
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url, :flash => { :success => "Payment was successfully deleted." }  }
      format.json { head :no_content }
    end
  end
end
