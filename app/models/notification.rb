class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"
  belongs_to :event, polymorphic: true

  validates_inclusion_of :occasion, in: %w( participation_created participation_achieved dare_created dare_sent dare_accepted ), on: :create, message: "Occasion %s is not included in the list" 

end
