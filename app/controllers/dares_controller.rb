class DaresController < ApplicationController
  before_action :set_dare, only: [:show, :edit, :update, :destroy]

  # GET /dares
  # GET /dares.json
 # participation controller

  def index  #feed
    @network_news = current_user.network_news
    @friends_list = current_user.friends_list
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

  # GET /dares/1/edit
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

  # PATCH/PUT /dares/1
  # PATCH/PUT /dares/1.json
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

  # DELETE /dares/1
  # DELETE /dares/1.json
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
      params.require(:dare).permit(:title, :description, :user_id, :category_id)
    end
end
