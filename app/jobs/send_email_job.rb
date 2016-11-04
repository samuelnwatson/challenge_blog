class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(email, subject)
		mail(to: email, subject: subject).deliver_now
  end
end
