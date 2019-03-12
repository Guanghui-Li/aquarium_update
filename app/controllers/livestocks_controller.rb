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
  end

  # GET /livestocks/new
  def new
    @livestock = Livestock.new
    @types = Type.all
  end

  # GET /livestocks/1/edit
  def edit
  end

  # POST /livestocks
  # POST /livestocks.json
  def create
    @livestock = Livestock.new(livestock_params.permit!)

    respond_to do |format|
      if @livestock.save
        format.html { redirect_to @livestock, notice: 'Livestock was successfully created.' }
        format.json { render :show, status: :created, location: @livestock }
      else
        format.html { render :new }
        format.json { render json: @livestock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /livestocks/1
  # PATCH/PUT /livestocks/1.json
  def update
    respond_to do |format|
      if @livestock.update(livestock_params)
        format.html { redirect_to @livestock, notice: 'Livestock was successfully updated.' }
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
    @livestock.destroy
    respond_to do |format|
      format.html { redirect_to livestocks_url, notice: 'Livestock was successfully destroyed.' }
      format.json { head :no_content }
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
