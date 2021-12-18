class FriendRequest < ApplicationRecord
  validates :sender, :receiver, presence: true
  validates_uniqueness_of :receiver, scope: :sender
  belongs_to :user, foreign_key: "receiver", class_name: "User"
end
