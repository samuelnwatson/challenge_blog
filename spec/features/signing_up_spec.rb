require "rails_helper"

RSpec.feature "Users are able to sign up" do
  before do
    visit "/"
  end

  scenario "with valid details" do
    click_link "Sign Up"
    fill_in "Email", with: "john@test.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")
  end
end

