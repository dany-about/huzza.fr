class StarDaresController < ApplicationController

  def create
    if StarDare.find_by(dare: Dare.find(params[:dare]), user: current_user) == nil
      StarDare.create!(dare: Dare.find(params[:dare]), user: current_user)
    end
  end
  
  def destroy
    if StarDare.exists?(params[:id])
      StarDare.find(params[:id]).destroy
    end
  end
  
end
