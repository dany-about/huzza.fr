class Dare < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :category, optional: true
  has_many :difficulty_ratings
  has_many :participations
  has_many :participants, through: :participations, class_name: "User"

  has_many :user_send_dares
  has_many :senders, through: :user_send_dares, class_name: "User", foreign_key: "sender_id"
  has_many :recipients, through: :user_send_dares, class_name: "User", foreign_key: "recipient_id"


  def difficulty
    diffs = [] 
    self.difficulty_ratings.each { |diff_rating| diffs << diff_rating.rating }
    return diffs.sum/diffs.count.round
  end

  def achievers
    achievers = []
    self.participations.where(is_achieved: true).each { |participation| achievers << participation.user }
    return achievers
  end

  def reward
  end

end
