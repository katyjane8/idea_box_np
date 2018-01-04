class Idea < ApplicationRecord
  validates :title, :body, presence: true
  has_attached_file :image
  belongs_to :category, optional: true
  belongs_to :user
  has_many :idea_images
  has_many :images, through: :idea_images
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
