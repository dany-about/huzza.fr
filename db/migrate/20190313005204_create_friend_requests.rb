class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.belongs_to :user_asking, index: true
      t.belongs_to :user_asked, index: true

      t.timestamps
    end
  end
end
