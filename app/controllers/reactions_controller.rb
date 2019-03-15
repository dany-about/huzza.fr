class ReactionsController < ApplicationController

  def create
    if Reaction.find_by(reactionable_type: params[:reactionable_type], reactionable_id: params[:reactionable_id], user: current_user) == nil
      Reaction.create!(reactionable_type: params[:reactionable_type], reactionable_id: params[:reactionable_id], user: current_user, name: params[:reaction])
    end
  end

  def update
  end
  
  def destroy
    if Reaction.exists?(params[:id])
      Reaction.find(params[:id]).destroy
    end
  end

end
