class Session < ApplicationRecord
  validates :token, presence: true, uniqueness: true
end
