class Event < ApplicationRecord
  belongs_to :user, :foreign_key => "owner_id", :class_name => "User"
end
