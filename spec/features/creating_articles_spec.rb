require "rails_helper"

RSpec.feature "Users can create new articles" do
	before do
		visit "/"
		click_link "New Article"
	end

	scenario "with valid attributes" do
		fill_in "Name", with: "Blog Entry"
		fill_in "Content", with: "Body of text for the article"
		click_button "Create Article"

		expect(page).to have_content "Article has been published."
	end

	scenario "with invalid attributes" do
		click_button "Create Article"

		expect(page).to have_content "Article has not been published."
		expect(page).to have_content "Name can't be blank"
	end
end