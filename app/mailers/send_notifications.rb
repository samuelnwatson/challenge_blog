class SendNotifications < ApplicationMailer
  @email = email
  @subject = article.name

  def later(email, article)
    mail(to: @email, subject: @subject).deliver_later
  end

  def now(email, article)
    mail(to: @email, subject: @subject).deliver_now
  end
end
