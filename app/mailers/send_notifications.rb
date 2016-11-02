class SendNotifications < ApplicationMailer
	def created(article, email)
		@article = article
		@email = email

		subject = "New challenge blog article: #{article.content}"
		SendEmailJob.set(wait: 20.seconds).perform_later(@email, subject)
	end
end
