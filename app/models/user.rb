class User < ApplicationRecord
  has_many :posts

  validates :username, presence: true, length: { maximum: 50 },
                       uniqueness: { case_sensitive: false }
  validates :email,    presence: true, length: { maximum: 255 },
                       format: { with: /.+@.+\..+/i }
  validates :password, presence: true
end
