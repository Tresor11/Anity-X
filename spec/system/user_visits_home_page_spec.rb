require 'rails_helper'

RSpec.describe "visiting home page" do
  scenario "when a user visits the home page" do
    article = create(:article, title: "Article1")
    article = create(:article, title: "Article2")

    visit root_path

    expect(page).to have_content("Article1")
  end
end
