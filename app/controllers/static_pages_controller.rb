class StaticPagesController < ApplicationController

  before_filter :authenticate, :only => [:home]

  def authenticate
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |username, password|
        username == "pay" && password == "MONKEE"
      end 
    end
  end

  def home
  	@user_count = User.count
  	@payment_total = Payment.sum(:amount)
  	if user_signed_in?
      redirect_to payments_path
      return
    end
  end

  def about
  end

end
