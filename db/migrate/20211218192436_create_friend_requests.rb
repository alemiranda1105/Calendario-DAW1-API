class CreateFriendRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_requests do |t|
      t.integer :sender
      t.integer :receiver

      t.timestamps
    end
  end
end
