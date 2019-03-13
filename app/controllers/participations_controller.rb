class ParticipationsController < ApplicationController

  def create 
    Participation.create!(user: current_user, dare: Dare.find(params[:dare])) 
    current_user.notify_followers(Dare.find(params[:dare]), "participation_created")
  end

  def update
  end

end