class UserMailers < ActionMailer::Base
  
  default :from => 'support@paymonkee.com', :return_path => 'support@paymonkee.com'

  def generate_url(user)
    if user.encrypted_password == ""  #user has not yet signed up
      return payments_url(:auth_token => user.authentication_token)
    else
      return payments_url
    end 
  end

  # this is called when a new payment is created from a registered user
  def welcome_email(payment)
    @payment = payment
    @url = generate_url(User.find_by_email(@payment.email))
    loaner_email = User.find(@payment.user_id).email

    mail(:to => @payment.email, :subject => "Yo, you owe some money!", :cc => loaner_email)
  end
  
  #this will send separate emails to each payee in the database, across all users
  def reminder_email(payment)
    @payment = payment
    @url = generate_url(User.find_by_email(@payment.email))
    #loaner_email = User.find(@payment.user_id).email

    mail(:to => @payment.email, :subject => "Reminder that you owe some money")
  end

  #this will send one email with all payments to each payee, from a particular user
  def reminder_email2(all_payments)
    @all_payments = all_payments
    @url = generate_url(User.find_by_email(@all_payments.first.email))
    #loaner_email = User.find(@all_payments.first.user_id).email

    mail(:to => @all_payments.first.email, :subject => "Reminder that you owe some money")
  end

  # this is called when a payment status changes to "paid"
  def paid_email(payment)
    @payment = payment

    mail(:to => User.find(@payment.user_id).email, :subject => "You've been paid back!", :cc => @payment.email)
  end
end
