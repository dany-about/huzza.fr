class UsersController < ApplicationController
#	attr_accessor :set_current_user
  def show
  	@user = User.friendly.find(params[:id])
  end
end
