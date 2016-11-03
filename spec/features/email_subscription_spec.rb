require "rails_helper"

RSpec.feature "Users can be sent emails on new articles posted" do
	let(:site_owner) { FactoryGirl.create(:user, :admin, email: "site_owner@challengeblog.com") }
	let(:site_user) { FactoryGirl.create(:user, :subscribed, email: "site_user@challengeblog.com") }

	before do
		@message_delivery = instance_double(ActionMailer::MessageDelivery)
		
		login_as(site_owner)
		visit "/"
	end

	scenario "users can receive an email" do
		click_link "New Article"
		fill_in "Name", with: "Blog Entry"
		fill_in "Content", with: "Body of text for the article"
		click_button "Create Article"

		expect(SendNotifications).to receive(:created).with(site_user.email, "Blog Entry").and_return(@message_delivery)
		expect(@message_delivery).to receive(:deliver_later)
	end
end
