require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        idea = Idea.new(body: "hello")
        expect(idea).to be_invalid
      end
    end

      it "is invalid without a body" do
        idea = Idea.new(title: "hello")
        expect(idea).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title and body" do
        user = create(:user)
        category = create(:category)
        idea = create(:idea, category: category, user: user)
        expect(idea).to be_valid
      end
    end

  describe "relationships" do
    it "belongs to a category" do
      user = create(:user)
      category = create(:category)
      idea = create(:idea, category: category, user: user)
      expect(idea).to respond_to(:category)
      expect(idea).to respond_to(:user)
    end
  end

end
