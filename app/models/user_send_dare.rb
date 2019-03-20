class UserSendDare < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
  belongs_to :dare

  # Polymorphic associations
  has_many :news, as: :event
  has_many :comments, as: :commentable
  has_many :reactions, as: :reactionable

  validate :sender_is_not_also_recipient
  validate :recipient_is_not_already_participating, on: :create

  def sender_is_not_also_recipient
    if self.sender == self.recipient
      errors.add(:user_send_dare, "Vous n'avez pas besoin de nous pour vous auto-défier !")
    end
  end

  def recipient_is_not_already_participating
    if self.recipient.participations.find_by(dare: self.dare) != nil
      errors.add(:user_send_dare, "#{recipient.full_name} participe déjà à ce défi !")
    end
  end

end
