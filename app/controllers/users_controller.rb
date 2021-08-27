class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result
    @businesses = Business.where(user_id: @users.ids).includes(:user)
  end

  def show
    @works = Work.where(user_id: @user.id)
    @businesses = Business.where(user_id: @user.id)
  end

  def edit
    redirect_to user_path(current_user), alert: '不正なアクセスです!' if @user != current_user
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'ユーザー情報を更新しました!'
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
