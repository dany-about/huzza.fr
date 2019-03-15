class ParticipationsController < ApplicationController
  
  def create 
    if Participation.find_by(user: current_user, dare: Dare.find(params[:dare])) == nil
      @participation = Participation.create!(user: current_user, dare: Dare.find(params[:dare])) 
      current_user.notify_followers(@participation, "participation_created")
    end
    respond_to do |format|
      format.js {render "news/index"}
    end
  end

  def update
    @participation = Participation.find(params[:id])
    @participation.is_achieved = nil
    current_user.notify_followers(@participation, "participation_achieved")
  end

end