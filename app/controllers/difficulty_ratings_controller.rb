class DifficultyRatingsController < ApplicationController

  def create
    if DifficultyRating.find_by(difficulty_rater: current_user, dare: Dare.find(params[:dare])) == nil
      DifficultyRating.create!(difficulty_rater: current_user, dare: Dare.find(params[:dare]), rating: params[:rating])
    end
  end

end
