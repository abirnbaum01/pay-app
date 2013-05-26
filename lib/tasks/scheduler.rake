
	desc "Send the reminder email"
	task :send_reminder_email => :environment do
		
		#if Time.now.friday?
			puts "Sending reminder emails..."

			Payment.all.each do |payment|
				UserMailer.reminder_email(payment).deliver
			end

			puts "done."
		#end
	end



#	TO:  payment.email
#	FROM:  payment.user.email
#	AMOUNT:  payment.amount
#	DESC:  payment.description



