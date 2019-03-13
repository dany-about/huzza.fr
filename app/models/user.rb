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

  
  # Miscellaneous
  has_many :news
  has_many :reactions
  has_many :difficulty_ratings, foreign_key: "difficulty_rater_id"

  def achieved_dares
    self.participated_dares.joins(:participations).where({ participations: {is_achieved: true} }).reverse
  end

  def rank
  end

  def badge
    case self.rank
    when 1 then return  end
    when 2 then return  end
    when 3 then return  end
    when 4 then return  end
    when 5 then return  end
    when 6 then return  end
    when 7 then return  end
    when 8 then return  end
    when 9 then return  end
    when 10 then return  end
    when 11 then return  end
    when 12 then return  end
    when 13 then return  end
    when 14 then return  end
    when 15 then return  end
    when 16 then return  end
    when 17 then return  end
    when 18 then return  end
    when 19 then return  end
    when 20 then return  end
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
