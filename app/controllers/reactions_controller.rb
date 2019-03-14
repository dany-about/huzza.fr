class ReactionsController < ApplicationController

  def create
    if Reaction.find_by(participation: Participation.find(params[:participation]), user: current_user) == nil
      Reaction.create!(participation: Participation.find(params[:participation]), user: current_user, name: params[:reaction])
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
