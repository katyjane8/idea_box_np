describe "User can visit their create idea page" do
  it "they see a form and checkboxes for images" do
    user = create(:user)
    category = create(:category, title: "party")
    image = create(:image)
    idea = create(:idea, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    click_on "Create Idea"

    fill_in "idea[title]", with: "knit somethin"
    fill_in "idea[body]", with: "so great"
    select category.title, from: "idea[category_id]"
    find("label[for='idea_image']").set(true)

    click_on "Create Idea"

    expect(current_path).to eq(user_idea_path(user, Idea.last))
    expect(page).to have_content("knit somethin")
    expect(page).to have_content("so great")
    expect(page).to have_content(category.title)
    # expect(image.first.selected?).to eql true
  end
end
