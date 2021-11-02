class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  scope :all_except,
        ->(user) { where.not(id: user) && where.not(id: user.friends.map(&:id))}

  has_and_belongs_to_many :friends, class_name: "User", join_table: :connections, association_foreign_key: :friend_id
  has_many :posts
  has_many :comments
  has_many :likes
  paginates_per 5

end
