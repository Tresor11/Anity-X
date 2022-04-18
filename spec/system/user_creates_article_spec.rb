require "rails_helper"
require "support/features/clearance_helpers"

RSpec.describe "user creates article" do
  context "as a signed in user" do
    scenario "with valid attributes" do
      sign_in

      visit new_article_path
      fill_in "Title", with: "Test Article"
      fill_in_trix_editor "article_content", with: "New Article Content"
      click_button "Create Article"

      expect(page).to have_content("Article was successfully created.")
      expect(page).to have_content("Test Article")
    end

    scenario "with invalid attributes" do
      sign_in

      visit new_article_path
      fill_in "Title", with: ""
      fill_in_trix_editor "article_content", with: "New Article Content"
      click_button "Create Article"

      expect(page).to have_content("Title can't be blank")
    end
  end

  context "as a signed out user" do
    scenario "is redirected to sign in page" do
      visit new_article_path
      expect(page).to have_content("Please sign in to continue.")
    end
  end
end