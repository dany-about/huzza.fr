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


  # after_create :first_dare_participation

  # def first_dare_participation
   # firstparticipation = Participation.create!(user: self, dare: Dare.all.sample, deadline: Time.new(2020))
   # puts firstparticipation
  # end


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
  has_many :followed_users, through: :reverse_follows, source: :user 
  
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
  has_many :difficulty_ratings
  has_many :comments

  def full_name
    self.first_name.to_s+" "+self.last_name.to_s
  end

  def ongoing_participations
    self.participations.where(is_achieved: false)
  end

  def reviewed_participations
    self.participations.where(is_achieved: nil)
  end

  def achieved_participations
    self.participations.where(is_achieved: true)
  end

  def achieved_participations_in(category)
    Participation.joins(:dare).where(user: self, is_achieved: true, dares: {category: Category.find_by(name: category)})
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

  def percent_to_next_lvl
    return (self.elo_points - User.exp_rank(self.rank))*100 /( User.exp_rank(self.rank+1) - User.exp_rank(self.rank) )
  end

  def rank
    20.times { |i| if (User.exp_rank(i+1)..User.exp_rank(i+2)-1).include?(self.elo_points) then return i+1 end }
  end

  def badge
    case self.rank
    when 1 then return { title: "Exporateur intergalactique", emote: "👨🏽‍🚀", animation:"icon bg-gradient-danger text-white rounded-circle icon-shape hover-rotate-90" }
    when 2 then return { title: "Chef en herbe", emote: "👩🏻‍🍳", animation: "icon bg-gradient-danger text-white rounded-circle icon-shape hover-scale-110" }
    when 3 then return { title: "Maraîcher des bois", emote: "👨🏾‍🌾", animation:"icon bg-gradient-danger text-white rounded-circle icon-shape hover-rotate-180" }
    when 4 then return { title: "Mage envoûtant", emote: "🧙‍♂️", animation:"icon bg-gradient-danger text-white rounded-circle icon-shape hover-scale-110" }
    when 5 then return { title: "Bouc masqué", emote: "🦹‍♂️", animation:"icon bg-gradient-danger text-white rounded-circle icon-shape hover-rotate-360" }
    when 6 then return { title: "Pink lady", emote: "👩🏻‍🎤", animation:"icon bg-gradient-danger text-white rounded-circle icon-shape hover-scale-110" }
    when 7 then return { title: "Chimiste fou", emote: "👨🏽‍🔬", animation:"icon bg-gradient-danger text-white rounded-circle icon-shape hover-rotate-90" }
    when 8 then return { title: "Peintre haute en couleur", emote: "👩🏾‍🎨", animation:"icon bg-gradient-danger text-white rounded-circle icon-shape hover-scale-110" }
    when 9 then return { title: "Pompière on fire", emote: "👩🏼‍🚒", animation:"icon bg-gradient-danger text-white rounded-circle icon-shape hover-rotate-180" }
    when 10 then return { title: "Géni en devenir", emote: "🧞‍♂️", animation:"icon bg-gradient-danger text-white rounded-circle icon-shape hover-scale-110" }
    when 11 then return { title: "Queen B", emote: "👸🏾", animation:"icon bg-gradient-danger text-white rounded-circle icon-shape hover-rotate-90" }
    when 12 then return { title: "Clown dangereux", emote: "🤡", animation:"icon bg-gradient-danger text-white rounded-circle icon-shape hover-scale-110" }
    when 13 then return { title: "Dracu-la plus belle", emote: "🧛‍♀️", animation:"icon bg-gradient-danger text-white rounded-circle icon-shape hover-rotate-360" }
    when 14 then return { title: "La seigneur des agneaux", emote: "🧝‍♂️", animation:"icon bg-gradient-danger text-white rounded-circle icon-shape hover-scale-110" }
    when 15 then return { title: "Zombie affectueux", emote: "🧟‍♂️", animation:"icon bg-gradient-danger text-white rounded-circle icon-shape hover-rotate-180" }
    when 16 then return { title: "Héroïne des temps modernes", emote: "🦸‍♀️", animation:"icon bg-gradient-danger text-white rounded-circle icon-shape hover-scale-110" }
    when 17 then return { title: "Gardien de troupeau", emote: "🤠", animation:"icon bg-gradient-danger text-white rounded-circle icon-shape hover-rotate-90" }
    when 18 then return { title: "Sirène malicieuse", emote: "🧜‍♀️", animation:"icon bg-gradient-danger text-white rounded-circle icon-shape hover-scale-110" }
    when 19 then return { title: "Inspecteur en chef", emote: "🕵🏾", animation:"icon bg-gradient-danger text-white rounded-circle icon-shape hover-rotate-180" }
    when 20 then return { title: "Merlin l'enchianteur", emote: "🧙‍♂️", animation:"icon bg-gradient-danger text-white rounded-circle icon-shape hover-rotate-360" }
    end
  end

  # Accomplishements and titles
  # A FAIRE

  # After create, automatic participation to basic dares
  def first_dare_participation
    if User.all.count > 1 
      firstparticipation = Participation.create!(user: self, dare: Dare.all.sample, deadline: Time.new(2020))
    end
  end

  def friends
    friends = []
    self.followers.each { |follower| if Follow.where({user: follower, follower: self}).count > 0 then friends << follower end }
    return friends
  end

  def nonreciprocal_followed_users
    array = []
    self.followed_users.each { |user| if user.friends.include?(self) then array << user end }
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
    News.create!(user: self, friend: self, event: event, occasion: occasion)
  end


end
