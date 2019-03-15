class DifficultyRatingsController < ApplicationController

  def create
    if DifficultyRating.find_by(user: current_user, dare: Dare.find(params[:dare])) == nil
      DifficultyRating.create!(user: current_user, dare: Dare.find(params[:dare]), rating: params[:rating])
    end
  end

end
