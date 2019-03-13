class StarDareController < ApplicationController

  def create
    StarDare.create!(dare: Dare.find(params[:dare]), user: current_user)
  end
  
end
