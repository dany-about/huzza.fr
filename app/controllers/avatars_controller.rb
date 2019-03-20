class AvatarsController < ApplicationController
  def create
    @user = User.friendly.find(params[:user_id])
    @user.avatar.attach(params[:avatar])
    redirect_to(edit_user_registration_path(@user))
  end
end