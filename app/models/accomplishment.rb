class Accomplishment < ApplicationRecord
  has_many :user_accomplishments
  has_many :users, through: :user_accomplishments

  def condition_satisfied_by(user)
    case self.id
    when 1 then return true if user.created_dares.count > 0
    when 2 then return true if user.friends.count > 0
    when 3 then return true if user.sent_dares.count > 0
    when 4 then return true if user.participations.count > 0
    # when 5 then return true if user.proofs.count > 0
    when 6 then return true if user.achieved_participations.count > 0
    when 7 then return true if user.difficulty_ratings.count > 0
    when 8 then return true if user.difficulty_ratings.count >= 10
    when 9 then return true if user.comments.count >= 20
    when 10 then return true if user.achieved_participations.count >= 5
    when 11 then return true if user.achieved_participations_in("Aventure") >= 5
    when 12 then return true if user.achieved_participations_in("Sport") >= 5
    when 13 then return true if user.achieved_participations_in("Art") >= 5
    when 14 then return true if user.achieved_participations_in("Green") >= 5
    when 15 then return true if user.achieved_participations_in("Charity") >= 5
    when 16 then return true if user.achieved_participations_in("Travel") >= 5
    when 17 then return true if user.achieved_participations_in("Self-help") >= 5
    when 18 then return true if user.achieved_participations_in("Experiences") >= 5
    when 19 then return true if user.achieved_participations_in("Gaming") >= 5
    when 20 then return true if user.achieved_participations_in("WTF") >= 5
    end
  end

end
