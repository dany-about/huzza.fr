class ReactionsController < ApplicationController

  def create
    Reaction.create!(participation: Participation.find(params[:participation]), user: current_user, name: params[:reaction])
  end

  def update
  end
  
  def destroy
    Reaction.find(params[:id]).destroy
  end

end
