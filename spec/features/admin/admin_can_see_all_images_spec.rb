require 'rails_helper'

describe "When I visit admin images index" do
  describe "as an admin" do
    scenario "I see all images" do
      image1 = create(:image)
      image2 = Image.create!(name: "kangaroo", url: "https://pixabay.com/en/wallaby-rednecked-wallaby-australia-3007670/")
      admin = User.create!(username: "admin", password: "admin", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_images_path

      expect(page).to have_link("Create Image")
      expect(page).to have_content(image1.name)
      expect(page).to have_content(image2.name)
    end
  end
end
