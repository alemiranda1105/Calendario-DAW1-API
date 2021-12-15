class User < ApplicationRecord
  validates :email, :username, :password, presence: true
  validates :email, :username, uniqueness: true
end
