require "rails_helper"

RSpec.feature "Users can only see the appropriate links" do
	let(:user) { FactoryGirl.create(:user) }
	let(:admin) { FactoryGirl.create(:user, :admin) }
	let(:article) { FactoryGirl.create(:article, name: "Proxy Article", content: "Minimum of ten characters") }

	context "anonymous users" do
		scenario "cannot see the New article link" do
			visit "/"
			expect(page).not_to have_link "New Article"
		end

		scenario "cannot see New Comment form" do
			visit article_path(article)
			expect(page).to_not have_content "New Comment"
		end
	end

	context "non-admin users (article viewers)" do
		before do
			login_as(user)
		end

		scenario "cannot see the New article link" do
			visit "/"
			expect(page).not_to have_link "New Article"
		end

		scenario "cannot see the Delete article link" do
			visit article_path(article)
			expect(page).not_to have_link "Delete Article"
		end

		scenario "cannot see the Edit article link" do
			visit article_path(article)
			expect(page).to_not have_link "Edit Article"
		end
		
		scenario "can see New Comment form" do
			visit article_path(article)
			expect(page).to have_content "New Comment"
		end		
	end

	context "admin users" do
		before do
			login_as(admin)
		end

		scenario "can see the New article link" do
			visit "/"
			expect(page).to have_link "New Article"
		end	

		scenario "can see the Delete article link" do
			visit article_path(article)
			expect(page).to have_link "Delete Article"
		end

		scenario "can see the Edit article link" do
			visit article_path(article)
			expect(page).to have_link "Edit Article"
		end
		
		scenario "can see New Comment form" do
			visit article_path(article)
			expect(page).to have_content "New Comment"
		end		
	end
end