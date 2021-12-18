class Event < ApplicationRecord
  validates :owner_id, :date, :description, :name, presence: true
  belongs_to :user, :foreign_key => "owner_id", :class_name => "User"
end
