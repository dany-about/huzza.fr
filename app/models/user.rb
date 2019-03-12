class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_dares, class_name: "Dare"
  has_many :participations
  has_many :participated_dares, through: :participations, source: :dare
  
  has_many :user_sent_dares, class_name: "UserSendDare", foreign_key: "sender_id"
  has_many :sent_dares, through: :user_sent_dares, source: :dare

  has_many :user_received_dares, class_name: "UserSendDare", foreign_key: "recipient_id"
  has_many :received_dares, through: :user_received_dares, source: :dare

  has_many :news, foreign_key: "user_id"

  def achieved_dares
    self.participated_dares.joins(:participations).where({ participations: {is_achieved: true} }).reverse
  end

  def friends_list
    friends_list = []
    self.news.each { |notif| friends_list << notif.friend }.uniq!
    return friends_list
  end

  def notify_friends(event, occasion)
    self.friends.each { |friend| 
      New.create!(user: friend, friend: self, event: event, occasion: occasion)
    }
  end


end
