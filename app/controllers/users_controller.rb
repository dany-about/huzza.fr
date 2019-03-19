class UsersController < ApplicationController
  respond_to :html, :js
  
  def show
    @user = User.friendly.find(params[:id])
  end

end
