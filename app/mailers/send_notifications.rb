class SendNotifications < ApplicationMailer
	def created(email, article)
		@article = article
		@email = email

		@subject = "#{@article}"
		SendEmailJob.set(wait: 20.seconds).deliver_later(@email, @subject)
	end
end
