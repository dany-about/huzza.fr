class UserSendDaresController < ApplicationController
  respond_to :js

  def create
    if UserSendDare.find_by(dare_id: params[:dare_id], sender: current_user, recipient_id: params[:recipient_id]) == nil
      usd = UserSendDare.create!(dare: Dare.find(params[:dare_id]), sender: current_user, recipient: User.find(params[:recipient_id]))
      current_user.notify_followers(Dare.find(params[:dare_id]), "dare_sent")
      User.find(params[:recipient_id]).notify_followers(Dare.find(params[:dare_id]), "dare_received")
    end
  end

end