class UsersController < ApplicationController
  respond_to :html, :js
#	attr_accessor :set_current_user
  def show
    @user = User.friendly.find(params[:id])
  end

end
