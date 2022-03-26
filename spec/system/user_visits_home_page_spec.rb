require 'rails_helper'

RSpec.describe "visiting home page" do
  scenario "when a user visits the home page" do
    article_1 = create(:article, title: "Article1")
    article_2 = create(:article, title: "Article2")

    visit root_path

    expect(page).to have_content("Article1")
    expect(page).to have_content("Article2")
  end

  scenario "when a user clicks on an article" do
    article = create(:article, title:"Article1", content: "This is the content of Article1")

    visit root_path
    expect(page).to have_link(
      "Article1",
      href: article_path(article)
    )
    click_on "Article1"
    expect(page).to have_content("This is the content of Article1")
  end
end
