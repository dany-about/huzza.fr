class StarDaresController < ApplicationController

  def create
    StarDare.create!(dare: Dare.find(params[:dare]), user: current_user)
  end
  
  def destroy
    StarDare.find(params[:id]), user: current_user).destroy
  end
  
end
