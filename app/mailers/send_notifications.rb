class SendNotifications < ApplicationMailer

  def later(email, article)
    mail(to: email, subject: article.name).deliver_later
  end

  def now(email, article)
    mail(to: email, subject: article.name).deliver_now
  end
end
