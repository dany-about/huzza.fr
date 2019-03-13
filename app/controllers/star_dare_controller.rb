class StarDareController < ApplicationController

  def create
    StarDare.create!(dare: Dare.find(params[:dare]), user: current_user)
  end
  
  def destroy
    StarDare.find_by(dare: Dare.find(params[:dare]), user: current_user).destroy
  end
  
end
