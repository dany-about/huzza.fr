class DifficultyRatingsController < ApplicationController
  respond_to :js

  def create
    if DifficultyRating.find_by(user: current_user, dare: Dare.find(params[:dare_id])) == nil
      DifficultyRating.create!(user: current_user, dare: Dare.find(params[:dare_id]), rating: params[:rating])
    end
  end

end
