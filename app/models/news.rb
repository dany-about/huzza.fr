class News < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"
  belongs_to :event, polymorphic: true
  
  validates_inclusion_of :occasion, in: %w( participation_created participation_achieved achievement_rejected dare_created dare_sent dare_received dare_accepted ), on: :create, message: "Occasion %s is not included in the list" 

  def is_unrated_by(user)
    case self.event.class.name
    when "Dare" then dare = self.event
    when "Participation" then dare = self.event.dare
    when "UserSendDare" then dare = self.event.dare
    end
    return true if dare.difficulty_ratings.where(user: user).count == 0
  end

end
