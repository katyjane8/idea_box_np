require 'rails_helper'

describe "user can delete an idea" do
  it "clicks delete and the idea is removed" do
    user = create(:user)
    idea1 = Idea.create!(title: "idea1", body: "knitting", user: user, category: build(:category))

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_idea_path(idea1.user, idea1)

    click_on 'Delete'

    expect(current_path).to eq(user_ideas_path(user))
    expect(page).to have_content(user.username)
    expect(page).to_not have_content(idea1.title)
    expect(page).to_not have_content(idea1.body)
  end
end
