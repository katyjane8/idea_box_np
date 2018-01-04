require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "Validations" do
    it "is valid with a title" do
      category = build(:category)

      expect(category).to be_valid
    end
  end

  describe "Relationships" do
    it "has many ideas" do
      category = build(:category)

      expect(category).to respond_to(:ideas)
    end
  end
end
