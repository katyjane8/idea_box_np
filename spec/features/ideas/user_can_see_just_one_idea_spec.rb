require 'rails_helper'

RSpec.feature "User sees a specific idea" do
  let!(:default_user) { User.create(username: 'katyjane',  password: 'testingtesting') }
  let!(:another_user) { User.create(username: 'mollyliz', password: 'yeahthispassword') }

  context 'as a logged in user' do
    scenario "user sees its own specific idea" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

      category = build(:category)
      idea = default_user.ideas.create(title: 'reading', body: 'books', category: category)

      visit user_idea_path(default_user, idea)

      expect(page).to have_content idea.title
      expect(page).to have_content idea.body
      expect(page).to have_content idea.category.title
    end

    scenario "user cannot see other users ideas" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(another_user)

      category = build(:category)
      idea = another_user.ideas.create(title: 'sewing', body: 'dress for Molly', category: category)

      visit user_idea_path(another_user, idea)
      expect(page).to have_content idea.title

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

      visit user_ideas_path(default_user)
      expect(page).to_not have_content idea.title
    end
  end
end
