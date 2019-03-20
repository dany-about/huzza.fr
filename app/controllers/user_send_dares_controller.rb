class UserSendDaresController < ApplicationController
  respond_to :js

  def create
    @new_sent_dare = UserSendDare.new(usd_params)
    @new_sent_dare.sender = current_user
    @new_sent_dare.dare = Dare.find(params[:dare_id])
    if @new_sent_dare.save
      current_user.notify_followers(Dare.find(params[:dare_id]), "dare_sent")
      User.find(params[:new_sent_dare][:recipient_id]).notify_followers(Dare.find(params[:dare_id]), "dare_received")
      @success = true
    end
  end

  def update
    sent_dare = UserSendDare.find(params[:id])
    if params[:answer] = "accept"
      sent_dare.update(accepted: true)
      Participation.create!(user: current_user, dare: sent_dare.dare)
      # FLASH NOTICE défi relevé
    elsif params[:answer] = "decline"
      sent_dare.update(accepted: false)
      # FLASH NOTICE défi refusé
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def usd_params
    params.require(:new_sent_dare).permit(:recipient_id)
  end

end