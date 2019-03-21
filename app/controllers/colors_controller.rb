class ColorsController < ApplicationController
  before_action :set_color, only: [:show, :edit, :update, :destroy]
  before_action :access_control, only: [:show, :edit, :update, :destroy]

  # GET /colors
  # GET /colors.json
  def index
    @colors = Color.order(:name).where("user_id = " + (current_user.id.to_s if current_user)).paginate(page: params[:page], per_page: 10)
  end

  # GET /colors/1
  # GET /colors/1.json
  def show
    @livestocks = Livestock.where("color_id = " + params[:id].to_s).paginate(page: params[:page], per_page: 10).order('purchase_date DESC')
  end

  # GET /colors/new
  def new
    @color = Color.new
  end

  # GET /colors/1/edit
  def edit
  end

  # POST /colors
  # POST /colors.json
  def create
    @color = Color.new(color_params)
    @color.user_id = current_user.id if current_user

    respond_to do |format|
      if @color.save
        format.html { redirect_to colors_path }
        flash[:success] = @color.name + ' was successfully created'
        format.json { render :show, status: :created, location: @color }
      else
        format.html { render :new }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colors/1
  # PATCH/PUT /colors/1.json
  def update
    respond_to do |format|
      if @color.update(color_params)
        format.html { redirect_to colors_path }
        flash[:success] = @color.name + ' was successfully updated'
        format.json { render :show, status: :ok, location: @color }
      else
        format.html { render :edit }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colors/1
  # DELETE /colors/1.json
  def destroy
    error_messages = []
    bullet = '&#8226 '
    respond_to do |format|
      if @color.destroy
        format.html { redirect_to colors_url }
        flash[:success] = @color.name + ' was successfully deleted'
        format.json { head :no_content }
      else
        format.html { redirect_to colors_url}
        @color.errors.full_messages.each do |message|
          error_messages.push(bullet + message)
        end
        flash[:warning] = error_messages.join("<br/>")
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color
      @color = Color.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def color_params
      params.require(:color).permit(:name)
    end
    
    def access_control
      if @color.user_id != current_user.id
        redirect_to livestocks_path
        flash[:danger] = "Access denied!"
      end
    end
end
