require 'rails_helper'

describe "User creates a new Idea and adds an image" do
  scenario "a logged in user can create a new idea and add an image to it" do
    user = create(:user)
    category = create(:category)
    image = create(:image)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
    click_on "Create Idea"

    expect(current_path).to eq(new_user_idea_path(user))

    fill_in "idea[title]", with: 'cool idea'
    fill_in "idea[body]",  with: 'I want to have a pizza party'

    click_button "Create Idea"

    expect(current_path).to eq(user_idea_path(user, Idea.last))
    expect(page).to have_content("cool idea")
    expect(page).to have_content("I want to have a pizza party")
    expect(page).to have_content category.title
  end
end
