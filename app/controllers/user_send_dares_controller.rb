class UserSendDaresController < ApplicationController

  def create
    if UserSendDare.find_by(dare: Dare.find(params[:dare]), sender: current_user, recipient: User.find(params[:recipient])) == nil
      UserSendDare.create!(dare: Dare.find(params[:dare]), sender: current_user, recipient: User.find(params[:recipient]))
      current_user.notify_followers(Dare.find(params[:dare]), "dare_sent_to_#{params[:recipient]}")
      User.find(params[:recipient]).notify_followers(Dare.find(dareId), "dare_received_from_#{current_user}")
    end
  end

  def update
  end

end
