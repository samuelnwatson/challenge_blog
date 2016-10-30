require "rails_helper"

RSpec.feature "Users can be sent emails on new articles posted" do
	let(:site_owner) { FactoryGirl.create(:user, :admin, email: "site_owner@challengeblog.com") }
	let(:site_user) { FactoryGirl.create(:user, email: "site_user@challengeblog.com") }

	before do
		login_as(site_owner)
		visit "/"
	end

#	scenario "users can receive an email" do
#		click_link "New Article"
#		fill_in "Name", with: "Blog Entry"
#		fill_in "Content", with: "Body of text for the article"
#		click_button "Create Article"
#
#		email = find_email!(site_user.email)
#		expected_subject = "Challenge Blog, new article: #{article.name}"
#		expect(email.subject).to eq expected_subject
#
#		click_first_link_in_email(email)
#		expect(current_path).to eq article_path(article)		
#	end

end
