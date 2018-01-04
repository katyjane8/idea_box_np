require 'rails_helper'

describe "registered user wants to log out" do
  context "they navigate to show page" do
    context "they click logout link" do
      context "they are redirected back to root page" do
        it "logs user out" do
          user = create(:user)
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

          visit "/users/#{user.id}"

          click_on "Log Out"

          expect(current_path).to eq(root_path)
        end
      end
    end
  end
end
