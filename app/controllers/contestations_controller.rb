class ContestationsController < ApplicationController
  respond_to :js

  def create
    if Contestation.find_by(user: current_user, participation_id: params[:id]) != nil
      Contestation.create!(user: current_user, participation_id: params[:id])
    end
  end

end
