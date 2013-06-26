class StaticPagesController < ApplicationController
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
