class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]


  def index
    # @users = User.all
    @search = User.ransack(params[:q])
    @users = @search.result(distinct: true)
  end

  def show
    @works = Work.where(user_id: @user.id)
    @businesses = Business.where(user_id: @user.id)
  end

  def edit
    if @user != current_user
      redirect_to user_path(current_user), alert: "不正なアクセスです!"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました!"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
