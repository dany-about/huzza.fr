class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)

    where(provider: auth['provider'], uid: auth['uid']).first_or_create do |user|
      user.email = auth['info']['email']
      user.password = (0...20).map { (65 + rand(26)).chr }.join
        # user.name = auth['info']['name']
     # user.image = auth['info']['image']
    end
  end

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

  # Active Storage Avatar Image
  has_one_attached :avatar

  # User Mailer
 # after_create :welcome_send

  # Welcome Email
 # def welcome_send
 #   UserMailer.welcome_email(self).deliver_now
 # end


end
