class Admin::ParticipationsController < ApplicationController
  before_action :is_admin?

  def index
  end

  def destroy
  end

  def is_admin?
    redirect_to "/" unless current_user.is_admin
  end

end
