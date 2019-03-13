class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend FriendlyId
  friendly_id :email, use: :slugged

  # Dares & Participations
  has_many :created_dares, class_name: "Dare", foreign_key: "creator_id"
  has_many :participations
  has_many :participated_dares, through: :participations, source: :dare
  
  # Friend requests, Friends & Follows 
  has_many :sent_friend_requests, class_name: "FriendRequest", foreign_key: "user_requesting_id"
  has_many :received_friend_requests, class_name: "FriendRequest", foreign_key: "user_asking_id"
  has_many :follows
  has_many :followers, through: :follows
  has_many :reverse_follows, class_name: "Follow", foreign_key: "follower_id"
  has_many :followed, through: :reverse_follows, source: :user 
  
  # Sending and receiving Dares
  has_many :user_sent_dares, class_name: "UserSendDare", foreign_key: "sender_id"
  has_many :sent_dares, through: :user_sent_dares, source: :dare
  has_many :user_received_dares, class_name: "UserSendDare", foreign_key: "recipient_id"
  has_many :received_dares, through: :user_received_dares, source: :dare

  # Starring Dares
  has_many :star_dares
  has_many :starred_dares, through: :star_dares, source: :dare

  # Rankings
  # Need to create a Rank table (user 1-N rank)
  
  # Miscellaneous
  has_many :news
  has_many :reactions
  has_many :difficulty_ratings, foreign_key: "difficulty_rater_id"


  def achieved_dares
    self.participated_dares.joins(:participations).where({ participations: {is_achieved: true} }).reverse
  end

  def friends
    friends = []
    self.followers.each { |follower| if Follow.all.where({user: follower, follower: self}).count > 0 then friends << follower end }
    return friends
  end

  def friends_list
    friends_list = []
    self.news.each { |news| friends_list << news.friend }.uniq!
    return friends_list
  end

  def notify_followers(event, occasion)
    self.followers.each { |follower| 
      News.create!(user: follower, friend: self, event: event, occasion: occasion)
    }
  end


end
