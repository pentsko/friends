class Friend < ApplicationRecord
	

	has_and_belongs_to_many :users, class_name: "Friend", join_table: :connections, association_foreign_key: :user_id
end
