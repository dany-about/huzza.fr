class FollowsController < ApplicationController
  respond_to :html, :js
  
  def create    
    if Follow.find_by(user: User.find(params[:user]), follower: current_user) == nil
      Follow.create!(user: User.find(params[:user]), follower: current_user)
    end
  end
  
  def destroy
    if Follow.exists?(params[:id])
      Follow.find(params[:id]).destroy
    end
    respond_to do |format|
      format.js {render :create}
    end
  end

end
