class BusinessesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_business, only: %i[show edit update destroy toggle_status]
  before_action :authorized_user?, only: %i[show edit update destroy]

  # GET /businesses or /businesses.json
  def index
    @businesses = current_user.businesses.order(created_at: "ASC").latest
  end

  # GET /businesses/1 or /businesses/1.json
  def show; end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
    redirect_to businesses_path, alert: '不正なアクセスです!' if @business.user_id != current_user.id
  end

  # POST /businesses or /businesses.json
  def create
    @business = current_user.businesses.build(business_params)
    respond_to do |format|
      if @business.save
        format.html { redirect_to businesses_path, notice: '作成しました！' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1 or /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: '更新しました！' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1 or /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: '削除しました！' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    @business.toggle_status!
    redirect_to businesses_path, notice: '勤務状態を更新しました！'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_business
    @business = Business.find(params[:id] || params[:business_id])
  end

  # Only allow a list of trusted parameters through.
  def business_params
    params.require(:business).permit(:title, :status)
  end

  def authorized_user?
    redirect_to businesses_path, alert: '権限がありません!' unless current_user || current_user.admin
  end
end
