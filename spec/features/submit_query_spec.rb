require "rails_helper"

RSpec.feature "Submit Query", js: true, type: :feature do
  scenario "add news query to queries list" do
    visit "/"
    fill_in "query", with: "123"
    click_button "Submit"
    expect(page).to have_text("123")
  end

end
