class PicturesController < ApplicationController

  def create
    @participation = Participation.find(params[:participation_id])
    @participation.pictures.attach(params[:pictures])
    redirect_back fallback_location: user_path(current_user)
  end
  
end
