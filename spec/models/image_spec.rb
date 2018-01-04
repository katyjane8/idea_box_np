require 'rails_helper'

RSpec.describe Image, type: :model do
  it {should have_many(:ideas).through(:idea_images)}
end
