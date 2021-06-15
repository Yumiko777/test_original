class WorksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_work, only: [:show, :edit, :update, :destroy]

  def index
    @works = Work.where(status: "未済" ).page(params[:page]).order(start_time: "DESC").per(3)
    @work = Work.new
  end

  def new
    @work = Work.new
  end

  def show
  end

  def create
    @work = current_user.works.build(work_params)
    # @work = Work.new(work_params)
    # @work.user_id = current_user.id
    if @work.save
      redirect_to works_path(@work), notice: "作成しました！"
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @work.update(work_params)
      redirect_to works_path(@work), notice: "更新しました！"
    else
      render :edit
    end
  end

  def destroy
    @work.destroy
    redirect_to works_path, notice: "削除しました！"
  end

  private
  def work_params
    params.require(:work).permit(:title, :content, :start_time, :status, :remarks)
  end

  def set_work
    @work = Work.find(params[:id])
  end
end
