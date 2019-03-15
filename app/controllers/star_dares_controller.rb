class StarDaresController < ApplicationController

  def create
    if StarDare.find_by(dare: Dare.find(params[:dare]), user: current_user) == nil
      StarDare.create!(dare: Dare.find(params[:dare]), user: current_user)
    end
    respond_to do |format|
      format.js {redirect_to "news/index"}
    end
  end
  
  def destroy
    if StarDare.exists?(params[:id])
      StarDare.find(params[:id]).destroy
    end
  end
  
end
