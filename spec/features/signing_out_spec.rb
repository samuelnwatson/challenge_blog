require "rails_helper"

RSpec.feature "Users can sign out" do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user)

    visit "/"
  end

  scenario "sign out" do
    click_link "Sign Out"
    
    expect(page).to have_content "Signed out successfully."
  end
end