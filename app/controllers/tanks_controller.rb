class TanksController < ApplicationController
  before_action :set_tank, only: [:show, :edit, :update, :destroy]
  before_action :access_control, only: [:show, :edit, :update, :destroy]

  # GET /tanks
  # GET /tanks.json
  def index
    @tanks = Tank.order(:name).where("user_id = " + (current_user.id.to_s if current_user))
  end

  # GET /tanks/1
  # GET /tanks/1.json
  def show
    @livestocks = Livestock.where("tank_id = " + params[:id].to_s)
  end

  # GET /tanks/new
  def new
    @tank = Tank.new
  end

  # GET /tanks/1/edit
  def edit
  end

  # POST /tanks
  # POST /tanks.json
  def create
    @tank = Tank.new(tank_params)
    @tank.user_id = current_user.id if current_user

    respond_to do |format|
      if @tank.save
        format.html { redirect_to @tank }
        flash[:success] = @tank.name + " was successfully created"
        format.json { render :show, status: :created, location: @tank }
      else
        format.html { render :new }
        format.json { render json: @tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tanks/1
  # PATCH/PUT /tanks/1.json
  def update
    respond_to do |format|
      if @tank.update(tank_params)
        format.html { redirect_to @tank }
        flash[:success] = @tank.name + " was successfully updated"
        format.json { render :show, status: :ok, location: @tank }
      else
        format.html { render :edit }
        format.json { render json: @tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tanks/1
  # DELETE /tanks/1.json
  def destroy
    error_messages = []
    bullet = '&#8226 '
    respond_to do |format|
      if @tank.destroy
        format.html { redirect_to tanks_url }
        flash[:success] = @tank.name + " was successfully deleted"
        format.json { head :no_content }
      else
        format.html { redirect_to tanks_url}
        @tank.errors.full_messages.each do |message|
          error_messages.push(bullet + message)
        end
        flash[:warning] = error_messages.join("<\br>")
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tank
      @tank = Tank.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tank_params
      params.require(:tank).permit(:name)
    end
    
    def access_control
      if @tank.user_id != current_user.id
        redirect_to livestocks_path
        flash[:danger] = "Access denied!"
      end
    end
end
