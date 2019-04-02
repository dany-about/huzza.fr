class AdminController < ApplicationController
  before_action :is_admin?

  def index
    @model = params[:model].constantize
  end

  def destroy
    params[:model].constantize.find(params[:id]).destroy
  end
  

  def is_admin?
    redirect_back fallback_location: "/" unless current_user.is_admin
  end
  
end
