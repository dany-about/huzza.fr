class Reaction < ApplicationRecord
  belongs_to :participation
  belongs_to :user

  validates_inclusion_of :name, in: %w( strong ), on: :create, message: "Reaction %s is not included in the list" 

  def emote

  end

end
