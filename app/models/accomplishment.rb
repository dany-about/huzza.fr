class Accomplishment < ApplicationRecord
  has_many :user_accomplishments
  has_many :users, through: :user_accomplishments
end
