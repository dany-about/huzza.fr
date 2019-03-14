class DifficultyRatingsController < ApplicationController

  def create
    DifficultyRating.create!(difficulty_rater: current_user, dare: Dare.find(params[:dare]), rating: params[:rating])
  end

end
