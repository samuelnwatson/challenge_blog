require "rails_helper"

RSpec.feature "Users can un/subscribe" do
	let(:user) { FactoryGirl.create(:user) }
	let(:subscribed_user) { FactoryGirl.create(:user, :subscribed) }

	scenario "as a subscribed user" do
		login_as(user)
		visit "/"
		click_link "Subscribe"

		expect(page).to have_content "You have subscribed."
	end

	scenario "as unsubscribed user" do
		login_as(subscribed_user)
		visit "/"
		click_link "Unsubscribe"

		expect(page).to have_content "You have unsubscribed."
	end

end