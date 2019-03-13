class UserSendDaresController < ApplicationController

  def create
    UserSendDare.create!(dare: Dare.find(params[:dare]), sender: current_user, recipient: User.find(params[:recipient]))
    current_user.notify_followers(Dare.find(params[:dare]), "dare_sent")
    User.find(params[:recipient]).notify_followers(Dare.find(dareId), "dare_received")
  end

  def update
  end

end
