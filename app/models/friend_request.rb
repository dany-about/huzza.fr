class FriendRequest < ApplicationRecord
  belongs_to :user_asking, class_name: "User"
  belongs_to :user_asked, class_name: "User"
end
