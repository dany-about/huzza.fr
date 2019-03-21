class AvatarsController < ApplicationController
  def create
    @user = User.friendly.find(params[:user_id])
    @user.avatar.attach(params[:avatar])
    redirect_to(user_path(current_user))
  end
end