class StaticPagesController < ApplicationController
  def home
  	@user_count = User.count
  	@payment_total = Payment.sum(:amount)
  end

  def about
  end

end
