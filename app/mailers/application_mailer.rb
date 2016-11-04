class ApplicationMailer < ActionMailer::Base
  default from: "new_article@challenge_blog.com"  
  layout 'mailer'
end
