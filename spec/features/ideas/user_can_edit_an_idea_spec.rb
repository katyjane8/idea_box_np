require 'rails_helper'

describe "user can edit an idea" do
  it "clicks edit and the idea is edited" do
    user = create(:user)
    image = create(:image)
    idea1 = Idea.create!(title: "this idea is cool", body: "stuff", user: user, category: build(:category))

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_idea_path(idea1.user, idea1)
    click_on 'Edit'

    expect(current_path).to eq(edit_user_idea_path(idea1.user, idea1))

    fill_in "idea[title]", with: "this new idea"
    fill_in "idea[body]",  with: "this new thing"
    select 'awesome idea2', from: 'idea[category_id]'

    click_on "Update Idea"

    expect(current_path).to eq(user_idea_path(idea1.user, idea1))
    expect(page).to have_content(user.username)
    expect(page).to have_content("this new idea")
    expect(page).to have_content("this new thing")
    expect(page).to have_content("awesome idea2")
    expect(page).to_not have_content(idea1.title)
    expect(page).to_not have_content(idea1.body)
  end
end
