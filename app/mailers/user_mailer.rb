class UserMailer < ActionMailer::Base
  default from: "no-reply@example.com", return_path: "returnpath@example.com"

  def welcome_email(payment, current_user)
  	@current_user = current_user
    @payment = payment
    @url  = payments_url
    mail(:to => payment.email, :subject => "Yo, you owe some money!")
  end
  #def reminder_email(payment)
  #	@current_user = current_user
  #	@payment = payment
  #	@url = payments_url
  #	mail(:to => payment.email, :subject => "Yo, you owe some money!")
  #end
end
