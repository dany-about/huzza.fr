class Contestation < ApplicationRecord
  belongs_to :user
  belongs_to :participation
end
