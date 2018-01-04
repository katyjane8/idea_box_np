require 'rails_helper'

describe "Admin deletes existing category" do
  it "an admin can delete a category" do
    admin = create(:admin)
    category = Category.create(title: 'awesometown')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path

    click_link "delete"

    expect(page).to_not have_content("awesometown")
  end
end
