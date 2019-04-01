class FollowsController < ApplicationController
  respond_to :html, :js
  
  def create    
    if Follow.find_by(user: User.find(params[:user]), follower: current_user) == nil
      Follow.create!(user: User.find(params[:user]), follower: current_user)
    end
  end
  
  def destroy
    if Follow.exists?(params[:id])
      follow = Follow.find(params[:id])
      if FriendRequest.find_by(user_asked: follow.user, user_asking: follow.follower) != nil
        FriendRequest.find_by(user_asked: follow.user, user_asking: follow.follower).destroy
      end
      follow.destroy
    end
    render :create
  end

end
