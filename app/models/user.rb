class User < ApplicationRecord
  validates :email, :username, :password, presence: true
  validates :email, :username, uniqueness: true
  has_many :group_users
  has_many :groups, through: :group_users
end
