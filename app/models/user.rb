class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :created_dares, class_name: "Dare"
  has_many :participations
  has_many :participated_dares, through: :participations, class_name: "Dare"
  
  has_many :user_sent_dares, class_name: "UserSendDare", foreign_key: "sender_id"
  has_many :sent_dares, through: :user_sent_dares, class_name: "Dare", source: :dare

  has_many :user_received_dares, class_name: "UserSendDare", foreign_key: "recipient_id"
  has_many :received_dares, through: :user_received_dares, class_name: "Dare", source: :dare
  

  def achieved_dares
    self.participated_dares.where(is_achieved: true)
  end



end
