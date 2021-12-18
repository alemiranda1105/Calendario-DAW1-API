class FriendRequest < ApplicationRecord
  validates :sender, :receiver, presence: true
  belongs_to :user, foreign_key: "receiver", class_name: "User"
end
