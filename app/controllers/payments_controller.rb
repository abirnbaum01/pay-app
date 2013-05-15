class PaymentsController < ApplicationController
  # GET /payments
  # GET /payments.json
  
  before_filter :authenticate_user!
  def index
    @payments = current_user.payments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payments }
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
    @payment = current_user.payments.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/1/edit
  def edit
    @payment = current_user.payments.find(params[:id])
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = current_user.payments.new(params[:payment])

    respond_to do |format|
      if @payment.save
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
