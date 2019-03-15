class FriendRequestsController < ApplicationController
  
  def create
    if FriendRequest.find_by(user_asked: User.find(params[:user]), user_requesting: current_user) == nil
      FriendRequest.create!(user_asked: User.find(params[:user]), user_requesting: current_user) == nil
    end
    
    # A FAIRE : On notifie la personne invitée
  end

  def destroy

    # On notifie la personne désinvitée (machin cancelled friend request)
  end
end
