class Category < ApplicationRecord
  validates :title, presence: true
  has_many :ideas, dependent: :destroy
end
