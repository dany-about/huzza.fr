class FriendRequestsController < ApplicationController
  
  def create
    if FriendRequest.find_by(user_asked: User.find(params[:user]), user_asking: current_user) == nil
      FriendRequest.create!(user_asked: User.find(params[:user]), user_asking: current_user)
    end
    
    # A FAIRE : On notifie la personne invitée
  end

  def destroy
    if FriendRequest.exists?(params[:id])
      FriendRequest.find(params[:id]).destroy
    end
    # A FAIRE : On notifie la personne désinvitée (machin cancelled friend request)
  end
end
