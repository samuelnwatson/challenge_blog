require "rails_helper"

RSpec.feature "Users can be sent emails on new articles posted" do
	let(:site_owner) { FactoryGirl.create(:user, :admin, email: "site_owner@challengeblog.com") }
	let(:site_user) { FactoryGirl.create(:user, :subscribed, email: "site_user@challengeblog.com") }

	before do
		@mail = ActionMailer::Base.deliveries.last
		login_as(site_owner)
		visit "/"
	end

	scenario "users can receive an email" do
		click_link "New Article"
		fill_in "Name", with: "Blog Entry"
		fill_in "Content", with: "Body of text for the article"
		click_button "Create Article"

		expect(last_email_sent).to have_content "Blog Entry"
	end
end
