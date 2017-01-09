RSpec.feature "Users can delete articles" do
  before do
    login_as(FactoryGirl.create(:user, :admin))		
    FactoryGirl.create(:article, name: "My Article", content: "Minimum of ten characters.")

    visit "/"
  end

  scenario "deleting an article" do
    click_link "My Article"
    click_link "Delete Article"

    expect(page).to have_content "Article has been deleted."
    expect(page).to have_no_content "My Article"
  end
end