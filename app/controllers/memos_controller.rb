class MemosController < ApplicationController
  before_action :set_memo, only: [:show, :edit, :update, :destroy]
  before_action :access_control, only: [:show, :edit, :update, :destroy]

  # GET /memos
  # GET /memos.json
  def index
    @memos = Memo.where("user_id = " + (current_user.id.to_s if current_user)).paginate(page: params[:page], per_page: 10).order('memo_date DESC')
  end

  # GET /memos/1
  # GET /memos/1.json
  def show
  end

  # GET /memos/new
  def new
    @memo = Memo.new
  end

  # GET /memos/1/edit
  def edit
  end

  # POST /memos
  # POST /memos.json
  def create
    @memo = Memo.new(memo_params)
    @memo.user_id = current_user.id if current_user

    respond_to do |format|
      if @memo.save
        format.html { redirect_to memos_path }
        flash[:success] = 'Memo was successfully created'
        format.json { render :show, status: :created, location: @memo }
      else
        format.html { render :new }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memos/1
  # PATCH/PUT /memos/1.json
  def update
    respond_to do |format|
      if @memo.update(memo_params)
        format.html { redirect_to memos_path }
        flash[:success] = 'Memo was successfully updated'
        format.json { render :show, status: :ok, location: @memo }
      else
        format.html { render :edit }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memos/1
  # DELETE /memos/1.json
  def destroy
    @memo.destroy
    respond_to do |format|
      format.html { redirect_to memos_url }
      flash[:success] = 'Memo was successfully deleted'
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memo
      @memo = Memo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memo_params
      params.require(:memo).permit(:description, :memo_date)
    end
    
    def access_control
      if @memo.user_id != current_user.id
        redirect_to livestocks_path
        flash[:danger] = "Access denied!"
      end
    end
end
