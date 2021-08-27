class WorksController < Teams::ApplicationController
  before_action :authenticate_user!
  before_action :set_work, only: %i[show edit update destroy toggle_status]

  def index
    @works = current_user.works.page(params[:page]).order(start_time: 'ASC').per(5)
    @pending_works = @works.where(status: 'false').page(params[:page]).order(start_time: 'ASC').per(10)
  end

  def new
    @work = Work.new
  end

  def show; end

  def create
    @work = current_user.works.build(work_params)

    if @work.save
      redirect_to works_path(@work), notice: '作成しました！'
    else
      render :new
    end
  end

  def edit
    redirect_to works_path, alert: '不正なアクセスです!' if @work.user_id != current_user.id
  end

  def update
    if @work.update(work_params)
      redirect_to works_path(@work), notice: '更新しました！'
    else
      render :edit
    end
  end

  def destroy
    @work.destroy
    redirect_to works_path, notice: '削除しました！'
  end

  def toggle_status
    @work.toggle_status!
    redirect_to @work, notice: '作業状態を更新しました！'
  end

  private

  def work_params
    params.require(:work).permit(:title, :content, :start_time, :status, :remarks, :user_id,
                                 :member_id).merge(status: params[:status])
  end

  def set_work
    @work = current_user.works.find(params[:id] || params[:work_id])
  end
end
