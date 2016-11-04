class SendNotifications < ApplicationMailer
	def created(email, article)
		@email = email
		@article = article

		SendEmailJob.perform_later(@email, @article)
	end
end
