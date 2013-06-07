class PaymentsController < ApplicationController
  # GET /payments
  # GET /payments.json
  
  
  before_filter :authenticate_user!
  
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
    @payment = current_user.payments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/new
  # GET /payments/new.json
  def new

    # Use "build" rather than "new" for association current_user.payments
    @payment = current_user.payments.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/1/edit
  def edit
    #test out hypothetically if a user was authenticated via token
    #@token = nil

    #if @token
    #  @payment = Payment.find(params[:id])
    #else
      @payment = current_user.payments.find(params[:id])
    #end
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = current_user.payments.build(params[:payment])
    
    #if payee does not exist as user, then create new user
    unless User.find_by_email(params[:payment][:email].downcase)  
      u = User.new({:email => params[:payment][:email].downcase, :password => nil, :password_confirmation => nil })
      u.skip_confirmation!
      u.save(:validate => false)  #skip validation
    end

    respond_to do |format|
      if @payment.save
        
        # Tell the UserMailer to send a welcome Email after save
        # UserMailer.welcome_email(@payment, current_user).deliver

        format.html { redirect_to payments_url, :flash => { notice: 'Payment was successfully created.' } }
        format.json { render json: @payment, status: :created, location: @payment }
      else
        format.html { render action: "new" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
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
