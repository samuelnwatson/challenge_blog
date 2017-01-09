RSpec.feature "users can edit articles" do
  before do
    login_as(FactoryGirl.create(:user, :admin))		
    FactoryGirl.create(:article, name: "My Article", content: "Minimum of ten characters.")

    visit "/"
    click_link "My Article"
    click_link "Edit Article"		
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "My Edited Article"
    click_button "Update Article"

    expect(page).to have_content "Article has been edited"
    expect(page).to have_content "My Edited Article"
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""

    expect(page).to_not have_content "Article has been edited"		
    expect(page).to_not have_content "My Edited Article"
  end
end