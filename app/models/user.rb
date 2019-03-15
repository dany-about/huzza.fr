class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth['provider'], uid: auth['uid']).first_or_create do |user|
      user.email = auth['info']['email']
      user.password = (0...20).map { (65 + rand(26)).chr }.join
      user.name = auth['info']['image']
      #user.avatar = auth['info']['image']
    end
  end

  validates :terms_of_service, acceptance: true

  after_create :first_dare_participation

  def first_dare_participation
    firstparticipation = Participation.create!(user: User.last, dare: Dare.all.sample, deadline: Time.new(2020))
    puts firstparticipation
  end


  extend FriendlyId
  friendly_id :first_name, use: :slugged

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

  # Accomplishments
  has_many :user_accomplishments
  has_many :accomplishments, through: :user_accomplishments
  
  # Miscellaneous
  has_many :news
  has_many :reactions
  has_many :difficulty_ratings, foreign_key: "difficulty_rater_id"

  def full_name
    self.first_name.to_s+" "+self.last_name.to_s
  end
  
  def achieved_dares
    self.participated_dares.joins(:participations).where({ participations: {is_achieved: true} }).reverse
  end

  # Active Storage Avatar Image
  has_one_attached :avatar

  # User Mailer
  after_create :welcome_send

  # Welcome Email
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  # EXP FORMULA
  def self.exp_rank(i)
    f = 100
    i == 1 ? (return 0) : ( (i-2).times { f = f * 1.5 + 50 }; return f.round(-1) )
  end

  def rank
    20.times { |i| if (User.exp_rank(i+1)..User.exp_rank(i+2)-1).include?(self.elo_points) then return i+1 end }
  end

  def badge
    case self.rank
    when 1 then return { title: "Empailleur de marmottes", emote: "🤠", animation:"icon bg-gradient-success text-white rounded-circle icon-shape hover-rotate-360" }
    when 2 then return { emote: "", animation: "" }
    when 3 then return { emote: "", animation: "" }
    when 4 then return { emote: "", animation: "" }
    when 5 then return { emote: "", animation: "" }
    when 6 then return { emote: "", animation: "" }
    when 7 then return { emote: "", animation: "" }
    when 8 then return { emote: "", animation: "" }
    when 9 then return { emote: "", animation: "" }
    when 10 then return { emote: "", animation: "" }
    when 11 then return { emote: "", animation: "" }
    when 12 then return { emote: "", animation: "" }
    when 13 then return { emote: "", animation: "" }
    when 14 then return { emote: "", animation: "" }
    when 15 then return { emote: "", animation: "" }
    when 16 then return ""
    when 17 then return ""
    when 18 then return ""
    when 19 then return ""
    when 20 then return ""
    end
  end

  # Accomplishements and titles
  # A FAIRE

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
