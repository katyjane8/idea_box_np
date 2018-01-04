class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  enum role: [:default, :admin]

  has_secure_password
  has_many :ideas

end
