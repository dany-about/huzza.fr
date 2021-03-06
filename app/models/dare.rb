class Dare < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :category
  has_many :difficulty_ratings, dependent: :destroy

  # Participations
  has_many :participations, dependent: :destroy
  has_many :participants, through: :participations, source: :user
  has_many :reactions, through: :participations, dependent: :destroy

  # Sending and receiving Dares
  has_many :user_send_dares, dependent: :destroy
  has_many :senders, through: :user_send_dares, source: :user, foreign_key: "sender_id"
  has_many :recipients, through: :user_send_dares, source: :user, foreign_key: "recipient_id"
  
  # Starring Dares
  has_many :star_dares, dependent: :destroy
  has_many :starrers, through: :star_dares, source: :user

  # Polymorphic associations for News, Comments & Reactions
  has_many :news, as: :event, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :participation_comments, through: :participations, source: :comments
  has_many :reactions, as: :reactionable, dependent: :destroy

  # Validations
  validates :description, presence: true, length: { in: 30..1000 }
  validates :title, presence: true, length: { minimum: 20, maximum: 140 }

  
  # Assuming difficulty ranges from 0 to 100
  def difficulty
    diffs = [] 
    self.difficulty_ratings.each { |diff_rating| diffs << diff_rating.rating }
    if diffs.count > 0 then return diffs.sum/diffs.count.round else return 0 end
  end

  def achievers
    achievers = []
    self.participations.where(is_achieved: true).each { |participation| achievers << participation.user }
    return achievers
  end

  def achievers_under_review
    achievers_under_review = []
    self.participations.where(is_achieved: nil).each { |participation| achievers_under_review << participation.user}
    return achievers_under_review
  end

  # TBD according to difficulty
  def reward
  end

end
