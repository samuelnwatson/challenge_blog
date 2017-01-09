require "rails_helper"

RSpec.feature "Users can comment on articles" do
  let(:user) { FactoryGirl.create(:user) }
  let(:article) { FactoryGirl.create(:article, name: "Proxy Article", content: "Minimum ten characters.") }

  scenario "as an anonymous user" do
    visit article_path(article)

    expect(page).to_not have_content "New Comment"
  end

  scenario "as any logged-in user" do
    login_as(user)
    visit article_path(article)
    fill_in "comment_text", with: "Amazing Post!"
    click_button "Create Comment"

    expect(page).to have_content "Comment has been created."
    within("#comments") do
      expect(page).to have_content "Amazing Post!"
    end
  end
end