class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :events, foreign_key: "group_id", class_name: "Event"
end
