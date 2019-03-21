class StockTypesController < ApplicationController
  before_action :set_stock_type, only: [:show, :edit, :update, :destroy]
  before_action :access_control, only: [:show, :edit, :update, :destroy]

  # GET /stock_types
  # GET /stock_types.json
  def index
    @stock_types = StockType.order(:name).where("user_id = " + (current_user.id.to_s if current_user)).paginate(page: params[:page], per_page: 10)
  end

  # GET /stock_types/1
  # GET /stock_types/1.json
  def show
    @livestocks = Livestock.where("stock_type_id = " + params[:id].to_s).paginate(page: params[:page], per_page: 10).order('purchase_date DESC')
  end

  # GET /stock_types/new
  def new
    @stock_type = StockType.new
  end

  # GET /stock_types/1/edit
  def edit
  end

  # POST /stock_types
  # POST /stock_types.json
  def create
    @stock_type = StockType.new(stock_type_params)
    @stock_type.user_id = current_user.id if current_user

    respond_to do |format|
      if @stock_type.save
        format.html { redirect_to stock_types_path }
        flash[:success] = @stock_type.name + ' was successfully created'
        format.json { render :show, status: :created, location: @stock_type }
      else
        format.html { render :new }
        format.json { render json: @stock_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_types/1
  # PATCH/PUT /stock_types/1.json
  def update
    respond_to do |format|
      if @stock_type.update(stock_type_params)
        format.html { redirect_to stock_types_path }
        flash[:success] = @stock_type.name + ' was successfully updated'
        format.json { render :show, status: :ok, location: @stock_type }
      else
        format.html { render :edit }
        format.json { render json: @stock_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_types/1
  # DELETE /stock_types/1.json
  def destroy
    error_messages = []
    bullet = '&#8226 '
    respond_to do |format|
      if @stock_type.destroy
        format.html { redirect_to stock_types_url }
        flash[:success] = @stock_type.name + ' was successfully deleted'
        format.json { head :no_content }
      else
        format.html { redirect_to stock_types_url}
        @stock_type.errors.full_messages.each do |message|
          error_messages.push(bullet + message)
        end
        flash[:warning] = error_messages.join("<br/>")
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_type
      @stock_type = StockType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_type_params
      params.require(:stock_type).permit(:name)
    end
    
    def access_control
      if @stock_type.user_id != current_user.id
        redirect_to livestocks_path
        flash[:danger] = "Access denied!"
      end
    end
end
