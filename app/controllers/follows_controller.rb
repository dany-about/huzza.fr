class FollowsController < ApplicationController

  def create    
    if Follow.find_by(user: User.find(params[:user]), follower: current_user) == nil
      Follow.create!(user: User.find(params[:user]), follower: current_user)
    end
  end
  
  def destroy
    if Follow.exists?(params[:id])
      Follow.find(params[:id]).destroy
    end
  end

end
