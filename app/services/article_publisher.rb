class ArticlePublisher
	attr_reader :article_proxy

	def self.build(scope, article_params)
		article = scope.build(article_params)

		new(article)
	end

	def initialize(article)
		@article_proxy = article
	end

	def save
		if @article_proxy.save
			email_subscribers
		end
	end

	def email_subscribers
#		User.subscribers.each do |user|
#			ArticleSender.created(@article, user).deliver_now
#		end
	end
end