class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :dare
  has_many :proofs

  validate :deadline_in_futur



  def deadline_in_futur
    if self.deadline != nil && self.deadline < DateTime.now
      errors.add(:deadline, "ne peut pas être déjà passée !")
    end
  end

  def cant_participate_twice
    if Participation.where({user: self.user, dare: self.dare}).count > 0
      errors.add(:dares, "déjà inscrit !")
    end
  end

end
