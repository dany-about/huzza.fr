class News < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"
  belongs_to :event, polymorphic: true
  # L'association polymorphic permet d'avoir une colonne event_type = "Dare" ou "Participation" et une colonne event_id 
  
  # validates_inclusion_of :occasion, in: %w( participation_created participation_achieved achievement_rejected dare_created dare_sent dare_accepted ), on: :create, message: "Occasion %s is not included in the list" 

end
