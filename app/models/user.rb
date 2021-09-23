class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :friends, class_name: "User", join_table: :connections, association_foreign_key: :friend_id
# has_many :connections
#  has_many :friends, throught: :connection
# validates :name, :uniqueness
has_many :posts

end
