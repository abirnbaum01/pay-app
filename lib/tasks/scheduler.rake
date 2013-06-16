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
			#puts "user #{user.email}"
			user.payments.group_by { |e| e.email }.each do |all_payments_with_email|
				#puts "payment #{all_payments_with_email.first}"
				all_payments_without_email = all_payments_with_email.second
				all_payments_without_email_and_no_paid = all_payments_without_email.reject { |e| e["paid"].include?("paid") }
				#puts "preparing to send"
				unless all_payments_without_email_and_no_paid.empty?
					UserMailers.reminder_email2(all_payments_without_email_and_no_paid).deliver
				end
				#puts "send completed"
			end
		end
	else
		puts "it is not Sunday..."
	end
	puts "done."
end



