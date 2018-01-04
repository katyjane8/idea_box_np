require 'rails_helper'

describe "When I visit new image page" do
  describe "as an admin" do
    it "I see a new image form" do
      admin = User.create!(username: "admin", password: "admin", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_image_path
      expect(current_path).to eq(new_admin_image_path)

      expect(page).to have_content("Attach an Image")
    end

    scenario "I can create a new image" do
      admin = User.create!(username: "admin", password: "admin", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_image_path
      attach_file("image[image]", File.join(Rails.root, '/app/assets/images/1.jpg'))

      click_on "Create Image"

      expect(current_path).to eq(admin_images_path)
    end
  end

  describe "as a default user" do
    scenario "I see a 404 error" do
      default_user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

      visit new_admin_image_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
