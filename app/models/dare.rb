class Dare < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :category, optional: true
  has_many :difficulty_ratings
  has_many :participations
  has_many :participants, through: :participations, class_name: "User"

  has_many :user_send_dares
  has_many :senders, through: :user_send_dares, source: :user, foreign_key: "sender_id"
  has_many :recipients, through: :user_send_dares, source: :user, foreign_key: "recipient_id"
  
  # Polymorphic association 
  has_many :notifications, as: :event

  validates :description, presence: true, length: { in: 100..1000}
  validates :title, presence: true, length: { minimum: 5, maximum: 140}

  # Assuming difficulty ranges from 0 to 100
  def difficulty
    diffs = [] 
    self.difficulty_ratings.each { |diff_rating| diffs << diff_rating.rating }
    return diffs.sum/diffs.count.round
  end

  def difficulty_level
    x = 
    case self.difficulty
    when 0..33 then return 1
    when 34..67 then return 2
    when 68..100 then return 3
    end
  end

  def achievers
    achievers = []
    self.participations.where(is_achieved: true).each { |participation| achievers << participation.user }
    return achievers.reverse
  end

  def reward
  end

end
