unless User.exists?(email: "owner@challengeblog.com")
	User.create!(email: "owner@challengeblog.com", password: "password", admin: true)
end

unless User.exists?(email: "visitor@challengeblog.com")
	User.create!(email: "visitor@challengeblog.com", password: "password")
end