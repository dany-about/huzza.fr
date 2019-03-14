class ParticipationsController < ApplicationController

  def create 
    @participation = Participation.create!(user: current_user, dare: Dare.find(params[:dare])) 
    current_user.notify_followers(@participation, "participation_created")
  end

  def update
    @participation = Participation.find_by(user: current_user, dare:Dare.find(params[:dare]))
    @participation.is_achieved = nil
    current_user.notify_followers(@participation, "participation_achieved")
  end

end