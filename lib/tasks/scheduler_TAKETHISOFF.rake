task :send_reminder_email => :environment do
	
	#if Time.now.friday?
		puts "Sending reminder emails..."

		Payment.all.each do |payment|
			UserMailers.reminder_email(payment).deliver
		end

		puts "done."
	#end
end

task :send_reminder_email2 => :environment do
	#if Time.now.friday?
		puts "Sending reminder emails..."

		User.all.each do |user|
			user.payments.group_by { |e| e.email }.each do |all_payments|
				#all_payments.second.each do |indv_payment|
				UserMailers.reminder_email2(all_payments.second).deliver
				
			end
		end

		puts "done."
	#end
end



