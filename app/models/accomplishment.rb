class Accomplishment < ApplicationRecord
  has_many :user_accomplishments
  has_many :users, through: :user_accomplishments

  def condition_satisfied_by(user)
    case self.id
    when 1 then return true if user.created_dares.count > 0
  # when 2 then return true if 
  # when 3 then return true if 
  # when 4 then return true if 
  # when 5 then return true if 
  # when 6 then return true if 
  # when 7 then return true if 
  # when 8 then return true if 
  # when 9 then return true if 
  # when 10 then return true if 
  # when 11 then return true if 
  # when 12 then return true if 
  # when 13 then return true if 
  # when 14 then return true if 
  # when 15 then return true if 
  # when 16 then return true if 
  # when 17 then return true if 
  # when 18 then return true if 
  # when 19 then return true if 
  # when 20 then return true if 
    end
  end

end
