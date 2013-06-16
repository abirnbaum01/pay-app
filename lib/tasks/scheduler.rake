#task :send_reminder_email => :environment do
	
#	if Time.now.friday?
#		puts "Sending reminder emails..."

#		Payment.all.each do |payment|
#			UserMailers.reminder_email(payment).deliver
#		end

#		puts "done."
#	end
#end

task :send_reminder_email2 => :environment do
	puts "Sending reminder emails..."
	if Time.now.sunday?
		puts "it is Sunday..."
		User.all.each do |user|
			user.payments.group_by { |e| e.email }.each do |all_payments|
				#all_payments.second.each do |indv_payment|
				UserMailers.reminder_email2(all_payments.second).deliver
				
			end
		end
	else
		puts "it is not Sunday..."
	end
	puts "done."
end



