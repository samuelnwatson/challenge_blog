class ApplicationMailer < ActionMailer::Base
  default from: "new_article@challenge_blog.com"
  default_url_options[:host]    
  layout 'mailer'
end
