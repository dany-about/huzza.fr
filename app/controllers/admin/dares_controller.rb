class Admin::DaresController < ApplicationController
  before_action :is_admin?

  def index
  end

  def destroy
    Dare.find(params[:id]).destroy
  end

  def is_admin?
    redirect_back fallback_location: "/" unless current_user.is_admin
  end

end
