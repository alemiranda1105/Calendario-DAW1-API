class User < ApplicationRecord
  validates :email, :username, :password, presence: true
  validates :email, :username, uniqueness: true
  has_many :group_users
  has_many :groups, through: :group_users
  has_and_belongs_to_many :friendships, class_name: "User",
                                        join_table: :friendships,
                                        foreign_key: :user_id,
                                        association_foreign_key: :friend_user_id
  has_many :events, foreign_key: "owner_id", class_name: "Event"
  has_many :friend_requests, foreign_key: "receiver", class_name: "FriendRequest"
end
