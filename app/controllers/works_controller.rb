class WorksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_work, only: [:show, :edit, :update, :destroy]

  def index
    # @works = current_user.works.page(params[:page]).order(start_time: "ASC").per(3)

    # @works = Work.where(status: 0 ).order(start_time: "ASC").page(params[:page]).per(5)
    @works = Work.where(status: "false" ).page(params[:page]).order(start_time: "ASC").per(3)
    @pending_works = @works.where(status: "false" ).page(params[:page]).order(start_time: "ASC").per(3)


  end

  def new
    @work = Work.new
  end

  def show
    # @member = current_user.members.find_by(team_id: @team.id)
  end

  def create
    @work = Work.new(work_params)
    # @work.member_id = Member.find_by(user_id: @user_id)
    @work.member = Member.find_by(user_id: current_user.id)
      # binding.irb
    if @work.save

      redirect_to works_path(@work), notice: "作成しました！"
    else
      render :new
    end
  end

  def edit
    if @work.user != current_user
      redirect_to works_path, alert: "不正なアクセスです!"
    end
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
    params.require(:work).permit(:title, :content, :start_time, :status, :remarks, :member_id).merge(status: params[:status])
  end

  def set_work
    # @work = Works.find(params[:id])
    @work = Works.find(params[:member_id])
  end
end
