class DaresController < ApplicationController
  before_action :set_dare, only: [:show,:edit, :update, :destroy]

  # GET /dares
  # GET /dares.json
 # participation controller

  def index
  end

  # GET /dares/1
  # GET /dares/1.json
  def show
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

  def edit
  end


  def update
    respond_to do |format|
      if @dare.update(dare_params)
        format.html { redirect_to @dare, notice: 'Dare was successfully updated.' }
        format.json { render :show, status: :ok, location: @dare }
      else
        format.html { render :edit }
        format.json { render json: @dare.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dare.destroy
    respond_to do |format|
      format.html { redirect_to dares_url, notice: 'Dare was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dare
      @dare = Dare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dare_params
      params.require(:dare).permit(:title, :description, :category_id)
    end
end
