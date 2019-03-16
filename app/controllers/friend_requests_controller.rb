class FriendRequestsController < ApplicationController
  respond_to :html, :js
  
  def create
    if FriendRequest.find_by(user_asked: User.find(params[:user]), user_asking: current_user) == nil
      FriendRequest.create!(user_asked: User.find(params[:user]), user_asking: current_user)
    end
    respond_to do |format|
      format.js {render template: 'users/show'}
    end

    # A FAIRE : On notifie la personne invitée
  end

  def destroy
    if FriendRequest.exists?(params[:id])
      FriendRequest.find(params[:id]).destroy
    end
    respond_to do |format|
      format.js {render template: 'users/show'}
    end

    # A FAIRE : On notifie la personne désinvitée (machin cancelled friend request)
  end
end
