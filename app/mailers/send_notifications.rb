class SendNotifications < ApplicationMailer
	def later(email, article)
	    @email = email
	    @subject = article.name
		@url  = "http://challengeblog.com"
		mail(to: @email, subject: @subject).deliver_later
	end

	def now(email, article)
	    @email = email
	    @subject = article.name
		@url  = "http://challengeblog.com"
		mail(to: @email, subject: @subject).deliver_now
	end
end
