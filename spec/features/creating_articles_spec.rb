require "rails_helper"

RSpec.feature "Users can create new articles" do
	scenario "with valid attributes" do
		visit "/"

		click_link "New Article"

		fill_in "Name", with: "Blog Entry"
		fill_in "Content", with: "Body of text for the article"
		click_button "Create Article"

		expect(page).to have_content "Article has been published."
	end
end