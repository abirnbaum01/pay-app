class UserMailer < ActionMailer::Base
  default from: "noficiations@example.com"

  def welcome_email(payment)
    @payment = payment
    @url  = root_path
    mail(:to => payment.email, :subject => "Yo, you owe me money!")
  end
end
