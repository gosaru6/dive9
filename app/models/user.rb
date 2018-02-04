class User < ApplicationRecord
  has_many :blogs
  validates :email, uniqueness: true, presence: true, length: { maximum: 255 },
                  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
