class LivestocksController < ApplicationController
  before_action :set_livestock, only: [:show, :edit, :update, :destroy]

  # GET /livestocks
  # GET /livestocks.json
  def index
    @livestocks = Livestock.all
  end

  # GET /livestocks/1
  # GET /livestocks/1.json
  def show
    @events = History.where("livestock_id = " + @livestock.id.to_s)
  end

  # GET /livestocks/new
  def new
    @livestock = Livestock.new
  end

  # GET /livestocks/1/edit
  def edit
  end

  # POST /livestocks
  # POST /livestocks.json
  def create
    @livestock = Livestock.new(livestock_params.permit!)
    
    if @livestock.save
      history = History.new(livestock_id: @livestock.id, event: "Purchased", event_date: @livestock.purchase_date, image: @livestock.image)
      history.save!
      respond_to do |format|
        format.html { redirect_to @livestock }
        flash[:success] = "Livestock was successfully created"
        format.json { render :show, status: :created, location: @livestock }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @livestock.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /livestocks/new
  def bulk_new
    @livestock = Livestock.new
  end
  
  # POST /livestocks
  # POST /livestocks.json
  def bulk_create
    quantity = livestock_params[:quantity].to_i
    success = 0;
    
    if quantity == 0
      redirect_to ('/livestocks/bulk_new')
      flash[:warning] = "quantity can't be left blank"
      return
    else
      quantity.times{
        @livestock = Livestock.new(livestock_params.permit!)
        if @livestock.save
          success = success + 1;
          history = History.new(livestock_id: @livestock.id, event: "Purchased", event_date: @livestock.purchase_date, image: @livestock.image)
          history.save!
        else
          respond_to do |format|
            format.html { render "livestocks/bulk_new" }
            format.json { render json: @livestock.errors, status: :unprocessable_entity }
          end
          break
        end
      }
    end
    if success == quantity
      redirect_to ('/livestocks')
      flash[:success] = quantity.to_s + " livestocks were successfully created"
    end
  end

  # PATCH/PUT /livestocks/1
  # PATCH/PUT /livestocks/1.json
  def update
    respond_to do |format|
      if @livestock.update(livestock_params.permit!)
        format.html { redirect_to @livestock }
        flash[:success] = "Livestock was successfully updated"
        format.json { render :show, status: :ok, location: @livestock }
      else
        format.html { render :edit }
        format.json { render json: @livestock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /livestocks/1
  # DELETE /livestocks/1.json
  def destroy
    error_messages = []
    bullet = '&#8226'
      if @livestock.destroy
        respond_to do |format|
          format.html { redirect_to :back }
          flash[:success] = 'Livestock was successfully destroyed'
          format.json { head :no_content }
        end
      else
        respond_to do |format|
          format.html { redirect_to livestocks_url}
          @livestock.errors.full_messages.each do |message|
            error_messages.push(bullet + message)
          end
          flash[:warning] = error_messages.join("<br/>")
          format.json { head :no_content }
        end
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_livestock
      @livestock = Livestock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def livestock_params
      params.fetch(:livestock, {})
    end
end
