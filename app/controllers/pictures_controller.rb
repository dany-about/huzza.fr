class PicturesController < ApplicationController
  def create
    @participation = Participation.find(params[:participation_id])
    @participation.pictures.attach(params[:pictures])
    redirect_to(home_index_path)
  end
end
