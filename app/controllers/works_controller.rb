class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]

  def index
    @works = Work.where(status: "未済" ).order(start_time: "ASC").page(params[:page]).per(3)
    @work = Work.new
  end

  def new
    @work = Work.new
  end

  def show
  end

  def create
    @work = Work.create(work_params)
    if @work.save
      redirect_to works_path, notice: "作成しました！"
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @work.update(work_params)
      redirect_to works_path, notice: "更新しました！"
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
