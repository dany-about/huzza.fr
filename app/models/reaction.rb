class Reaction < ApplicationRecord
  belongs_to :reactionable, polymorphic: true
  belongs_to :user

  validates_inclusion_of :name, in: %w( strong ), on: :create, message: "Reaction %s is not included in the list" 

  def emote
    case self.name
    when "strong" then return "💪"
    end
  end

end
