task :send_reminder_email => :environment do
	puts "Sending reminder emails..."
	Payment.send_reminder_email
	puts "done."
end