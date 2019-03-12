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
  

  def achieved_dares
    self.participated_dares.joins(:participations).where({ participations: {is_achieved: true} }).reverse
  end

  def network_news
    network = self.friends
    network_news = []
    network.each { |friend| 
      friend.participations.each { |participation| network_news << {event: participation, occasion: "participation_created", friend: friend, date: participation.created_at} }
      friend.participations.where(is_achieved: true).each { |participation| network_news << {event: participation, occasion: "participation_achieved" friend: friend, date: participation.updated_at} }
      friend.created_dare.each { |dare| network_news << {event: dare, occasion: "dare_created", friend: friend, date: dare.created_at} }
      friend.sent_dare.each { |sent_dare| network_news << {event: sent_dare, occasion: "dare_sent", friend: friend, date: sent_dare.user_dare.created_at} }
      friend.received_dare.each { |received_dare| network_new << {event: received_dare, occasion: "dare_accepted", friend: friend, date: friend.participations.find_by(dare: received_dare).created_at} }
    }
    network_news.sort_by!{ |news| news[:date] }
    return network_news
  end

  def friends_list
    friends_list = []
    self.network_news.each { |news|  friends_list << news[:friend] }.uniq!
    return friends_list
  end

end
