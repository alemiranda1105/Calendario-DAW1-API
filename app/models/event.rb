class Event < ApplicationRecord
  validates :date, :description, :name, presence: true
  belongs_to :user, :foreign_key => "owner_id", :class_name => "User", optional: true
  belongs_to :group, :foreign_key => "group_id", :class_name => "Group", optional: true
end
