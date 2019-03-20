class FriendRequestsController < ApplicationController
  respond_to :html, :js
  
  def create
    if FriendRequest.find_by(user_asked: User.find(params[:user]), user_asking: current_user) == nil
      FriendRequest.create!(user_asked: User.find(params[:user]), user_asking: current_user)
      Follow.create!(user: User.find(params[:user]), follower: current_user) unless Follow.find_by(user: User.find(params[:user]), follower: current_user) != nil
    end
    respond_to do |format|
      format.js {render template: 'follows/create'}
    end

    # A FAIRE : On notifie la personne invitée
  end

  def update
    if FriendRequest.exists?(params[:id])
      FriendRequest.find(params[:id]).destroy
    end
    respond_to do |format|
      format.js {render template: 'follows/create'}
    end
  end

  def destroy
    if FriendRequest.exists?(params[:id])
      request = FriendRequest.find(params[:id])
      if params[:answer] == "Accept"
        Follow.create!(user: request.user_asking, follower: current_user) unless Follow.find_by(user: request.user_asking, follower: current_user) != nil
        # A FAIRE : Notif request.user_asking : Demande acceptée
      elsif params[:answer] == "Decline"
        # A FAIRE : Notif request.user_asking : Demande non acceptée
      end
      request.destroy        
    end
  end

end
