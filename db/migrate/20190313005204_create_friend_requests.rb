class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :follower, index: true

      t.timestamps
    end
  end
end
