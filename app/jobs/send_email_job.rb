class SendEmailJob < ActiveJob::Base
  queue_as :default

  def deliver_later(email, subject)
		mail(to: email, subject: subject)
  end
end
