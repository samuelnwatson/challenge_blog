require "rails_helper"

RSpec.feature "Existing users can sign in" do

	before do
		visit "/"
	end

	let!(:user) { FactoryGirl.create(:user) }

	scenario "with correct details" do
		click_link "Sign In"
		fill_in "Email", with: user.email
		fill_in "Password", with: "password"
		click_button "Log in"

		expect(page).to have_content "Signed in successfully."
		expect(page).to have_content "Signed in as #{user.email}"
	end
end