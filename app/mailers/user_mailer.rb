class UserMailer < ActionMailer::Base
  default from: "no-reply@example.com", return_path: "returnpath@example.com"

  def welcome_email(payment, current_user)
  	@current_user = current_user
    @payment = payment
    @url  = payments_url
    mail(:to => payment.email, :subject => "Yo, you owe some money!")
  end
  
  #this will send separate emails to each payee in the database, across all users
  def reminder_email(payment)
    @payment = payment
    @url = payments_url
    mail(:to => payment.email, :subject => "Reminder that you owe some money")
  end

  #this will send one email with all payments to each payee, from a particular user
  def reminder_email2(all_payments)
    @all_payments = all_payments
    @url = payments_url
    mail(:to => all_payments.first.email, :subject => "Reminder that you owe some money")
  end

end
