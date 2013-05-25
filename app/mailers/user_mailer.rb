class UserMailer < ActionMailer::Base
  default from: "no-reply@example.com", return_path: "returnpath@example.com"

  def welcome_email(payment)
    @payment = payment
    @url  = payments_url
    mail(:to => payment.email, :subject => "Yo, you owe some money!")
  end
end
