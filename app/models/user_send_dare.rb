class UserSendDare < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
  belongs_to :dare

  validate :sender_is_not_also_recipient

  def sender_is_not_also_recipient
    if self.sender == self.recipient
      errors.add("Vous n'avez pas besoin de nous pour vous auto-défier !")
    end
  end

end
