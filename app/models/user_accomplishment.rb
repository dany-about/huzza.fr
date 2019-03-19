class UserAccomplishment < ApplicationRecord
  belongs_to :user
  belongs_to :accomplishment
end
