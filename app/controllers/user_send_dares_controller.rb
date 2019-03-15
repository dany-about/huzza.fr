class UserSendDaresController < ApplicationController

  def create
    if UserSendDare.find_by(dare: Dare.find(params[:dare]), sender: current_user, recipient: User.find(params[:recipient])) == nil
      usd = UserSendDare.create!(dare: Dare.find(params[:dare]), sender: current_user, recipient: User.find(params[:recipient]))
      current_user.notify_followers(Dare.find(params[:dare]), "dare_sent_to_#{params[:recipient]}_from_#{current_user.id}")
      User.find(params[:recipient]).notify_followers(Dare.find(dareId), "dare_received_from_#{current_user}_to_#{params[:recipient]}")
    end
  end

  def update
  end

end
