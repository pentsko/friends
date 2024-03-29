class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  validates :body, presence: true, length: { minimum: 2 }
  belongs_to :user
  has_many :comments
  has_many :likes
  paginates_per 5
end
