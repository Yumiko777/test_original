class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user), alert: "不正なアクセスです!"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました!"
  end

  private
  def user_params
    params.require(:user).permit(:username, :email)
  end
end
