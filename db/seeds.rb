unless User.exists?(email: "owner@challengeblog.com")
	User.create!(email: "owner@challengeblog.com", password: "password", admin: true)
end

unless User.exists?(email: "visitor@challengeblog.com")
	User.create!(email: "visitor@challengeblog.com", password: "password")
end

["Blog Post 1", "Blog Post 2"].each do |name|
	unless Article.exists?(name: name)
		Article.create!(name: name,
			content: %{
			Some of these words *are emphasized*.
			Some of these words _are emphasized also_.

			Use two asterisks for **strong emphasis**.
			Or, if you prefer, __use two underscores instead__.

			+   Candy.
			+   Gum.
			+   Booze.

			I get 10 times more traffic from [Google][1] than from
			[Yahoo][2] or [MSN][3].

			[1]: http://google.com/        "Google"
			[2]: http://search.yahoo.com/  "Yahoo Search"
			[3]: http://search.msn.com/    "MSN Search"
			}
		)
	end
end