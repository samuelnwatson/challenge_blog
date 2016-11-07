require "rails_helper"

RSpec.feature "Users can be sent emails on new articles posted" do
	let!(:site_owner) { FactoryGirl.create(:user, :admin, email: "site_owner@challengeblog.com") }
	let!(:site_user) { FactoryGirl.create(:user, :subscribed, email: "site_user@challengeblog.com") }
	let!(:entry) { FactoryGirl.create(:article, name: "Blog Entry", content: "Minimum of ten characters.") }


	before do
		login_as(site_owner)
		visit "/"
	end

	scenario "users can receive an email" do
		click_link "New Article"
		fill_in "Name", with: "Blog Entry"
		fill_in "Content", with: "Body of text for the article"
		click_button "Create Article"

		expect(SendNotifications).to(receive(:later).with(site_user.email, "Blog Entry"))
	end


	scenario "generated email links to unsubscribe" do
		SendNotifications.now(site_user.email, entry)
		
		email = find_email!(site_user.email)

		click_first_link_in_email(email)
		expect(current_path).to eq u_users_index_path
	end
end
