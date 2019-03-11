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

  # User Mailer
  after_create :welcome_send


  # Welcome Email
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end


end
