require 'rails_helper'

describe "user sees a list of ideas" do
  scenario "user has multiple ideas on a page" do
    user = create(:user)
    idea1 = Idea.create!(title: "idea1", body: "knitting", user: user, category: build(:category))
    idea2 = Idea.create!(title: "idea2", body: "sewing", user: user, category: build(:category))

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_ideas_path(user)

    expect(page).to have_link("Create a New Idea")
    expect(page).to have_content(idea1.title)
    expect(page).to have_content(idea1.body)
    expect(page).to have_content(idea2.title)
    expect(page).to have_content(idea2.body)
  end
end
