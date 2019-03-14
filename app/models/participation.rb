class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :dare
  has_many :reactions

  # Polymorphic associations
  has_many :news, as: :event
  has_many :comments, as: :commentable

  # Validations
  validate :deadline_in_futur
  validate :cant_participate_twice

  def deadline_in_futur
    if self.deadline != nil && self.deadline < DateTime.now
      errors.add(:deadline, "ne peut pas être déjà passée !")
    end
  end

  def cant_participate_twice
    if Participation.find_by(user: self.user, dare: self.dare) != nil
      errors.add(:dare, "déjà inscrit !")
    end
  end

end
