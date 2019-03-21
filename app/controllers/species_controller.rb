class SpeciesController < ApplicationController
  before_action :set_species, only: [:show, :edit, :update, :destroy]
  before_action :access_control, only: [:show, :edit, :update, :destroy]

  # GET /species
  # GET /species.json
  def index
    @species = Species.order(:name).where("user_id = " + (current_user.id.to_s if current_user))
  end

  # GET /species/1
  # GET /species/1.json
  def show
    @livestocks = Livestock.where("species_id = " + params[:id].to_s)
  end

  # GET /species/new
  def new
    @species = Species.new
  end

  # GET /species/1/edit
  def edit
  end

  # POST /species
  # POST /species.json
  def create
    @species = Species.new(species_params)
    @species.user_id = current_user.id if current_user

    respond_to do |format|
      if @species.save
        format.html { redirect_to species_index_path }
        flash[:success] = @species.name + " was successfully created"
        format.json { render :show, status: :created, location: @species }
      else
        format.html { render :new }
        format.json { render json: @species.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /species/1
  # PATCH/PUT /species/1.json
  def update
    respond_to do |format|
      if @species.update(species_params)
        format.html { redirect_to species_index_path }
        flash[:success] = @species.name + " was successfully updated"
        format.json { render :show, status: :ok, location: @species }
      else
        format.html { render :edit }
        format.json { render json: @species.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /species/1
  # DELETE /species/1.json
  def destroy
    error_messages = []
    bullet = '&#8226 '
    respond_to do |format|
      if @species.destroy
        format.html { redirect_to species_index_url }
        flash[:success] = @species.name + " was successfully deleted"
        format.json { head :no_content }
      else
        format.html { redirect_to species_index_url}
        @species.errors.full_messages.each do |message|
          error_messages.push(bullet + message)
        end
        flash[:warning] = error_messages.join("<\br>")
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_species
      @species = Species.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def species_params
      params.require(:species).permit(:name, :stock_type_id)
    end
    
    def access_control
      if @species.user_id != current_user.id
        redirect_to livestocks_path
        flash[:danger] = "Access denied!"
      end
    end
end
