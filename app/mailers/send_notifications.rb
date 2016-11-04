class SendNotifications < ApplicationMailer
	def created(email, subject)
		SendEmailJob.perform_later(email, subject)
	end
end
