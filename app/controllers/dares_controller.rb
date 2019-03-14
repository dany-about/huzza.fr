class DaresController < ApplicationController
  before_action :set_dare, only: [:show,:edit, :update, :destroy]
  after_create :notify_followers
  before_action :set_user_in_js

  # GET /dares
  # GET /dares.json
 # participation controller

  def index  #feed
    @user = current_user
    @network = @user.friends
    @network_news = []
    @network.each { |friend| 
      friend.participations.each { |participation| @network_news << {event: participation, occasion: "participation_created", friend: friend, date: participation.created_at} }
      friend.participations.where(is_achieved: true).each { |participation| @network_news << {event: participation, occasion: "participation_achieved" friend: friend, date: participation.updated_at} }
      friend.created_dare.each { |dare| @network_news << {event: dare, occasion: "dare_created", friend: friend, date: dare.created_at} }
      friend.sent_dare.each { |sent_dare| @network_news << {event: sent_dare, occasion: "dare_sent", friend: friend, date: sent_dare.user_dare.created_at} }
      friend.received_dare.each { |dare| @network_new << {event: dare, occasion: "dare_accepted", friend: friend, date: friend.participations.find_by(dares: dare).created_at} }
    }

    @network_news.sort_by!{ |news| news[:date] }
    @friends_list = []
    @network_news.each { |news|  @friends_list << news[:friend] }.uniq!


  end


# index.html.erb (feed view)



  # GET /dares/1
  # GET /dares/1.json
  def show
  end

  # GET /dares/new
  def new
    @dare = Dare.new
  end

  def edit
  end

  # POST /dares
  # POST /dares.json
  def create
    @dare = Dare.new(dare_params)

    respond_to do |format|
      if @dare.save
        format.html { redirect_to @dare, notice: 'Dare was successfully created.' }
        format.json { render :show, status: :created, location: @dare }
      else
        format.html { render :new }
        format.json { render json: @dare.errors, status: :unprocessable_entity }
      end
    end
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

  def notify_followers
    current_user.notify_followers(event: @dare, occasion: "dare_created")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dare
      @dare = Dare.find(params[:id])
    end

    def set_user_in_js
      render json: {current_user: current_user}
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dare_params
      params.require(:dares).permit(:title, :description, :user_id, :category_id)
    end
end
