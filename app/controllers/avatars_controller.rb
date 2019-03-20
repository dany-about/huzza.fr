class AvatarsController < ApplicationController
  def create
    @user = User.friendly.find(params[:user_id])
    @user.avatar.attach(params[:avatar])
    redirect_to(root_path)
  end
end