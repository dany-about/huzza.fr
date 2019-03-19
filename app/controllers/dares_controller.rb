class DaresController < ApplicationController

  def index
  end

  def new
  end

  def create
    @dare = Dare.new(dare_params)
    @dare.creator = current_user
    if @dare.save
      if params[:recipient_id] != nil
        sent_dare = UserSendDare.create!(sender: current_user, recipient: User.find(params[:recipient_id]), dare: @dare)
        current_user.notify_followers(sent_dare, "dare_sent")
        User.find(params[:recipient_id]).notify_followers(sent_dare, "dare_received")
      else 
        current_user.notify_followers(@dare, "dare_created")
      end
      if params[:participate] == "yes"
        participation = Participation.create(user: current_user, dare: @dare)
        current_user.notify_followers(participation, "participation_created")
      end
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def dare_params
      params.require(:dare).permit(:title, :description, :category_id)
    end
end
