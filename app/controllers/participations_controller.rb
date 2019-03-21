class ParticipationsController < ApplicationController
  respond_to :js
  
  def create 
    if Participation.find_by(user: current_user, dare: Dare.find(params[:dare])) == nil
      @participation = Participation.create!(user: current_user, dare: Dare.find(params[:dare]))
      current_user.notify_followers(@participation, "participation_created")
    end
  end

  def update
    @participation = Participation.find(params[:id])
    @participation.update(is_achieved: nil)
    current_user.notify_followers(@participation, "participation_achieved")
  end

  private

  def participation_params
    params.require(:participation).permit(pictures: [])
  end

end