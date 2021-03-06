class DaresController < ApplicationController
  respond_to :js, :html

  def index
  end

  def new
    @dare = Dare.new
  end

  def create
    @dare = Dare.new(dare_params)
    @dare.creator = current_user
    if @dare.save
      if params[:recipient_id] != nil
        sent_dare = UserSendDare.create!(sender: current_user, recipient: User.find(params[:recipient_id]), dare: @dare)
        current_user.notify_followers(sent_dare, "dare_sent")
        User.find(params[:recipient_id]).notify_followers(sent_dare, "dare_received")
        flash[:success] = "Défi créé et envoyé !"
      elsif params[:participate] == "yes"
        participation = Participation.create(user: current_user, dare: @dare)
        current_user.notify_followers(participation, "participation_created")
        flash[:success] = "Défi créé et participation enregistrée !"
      else
        flash[:success] = "Défi créé !"        
      end
      current_user.notify_followers(@dare, "dare_created")
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
