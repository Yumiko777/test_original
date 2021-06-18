class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team

  def new
    @member = @team.members.build
    @users = @team.none_member_users
  end

  def create
    @team.selected_user_ids = team_params[:selected_user_ids]
    if @team.create_members
      redirect_to teams_path(@team), notice: "チームにメンバーを追加しました！"
    else
      @member = @team.members.build
      @users = @team.none_member_users
      render :new
    end
  end

  def show
  end

  def edit
    @users = @team.member_users
    redirect_to team_path(@team), notice: "チームメンバーを編集しました！"
  end

  def update
    if @member.update(member_params)
      redirect_to team_path(@team), notice: "チーム情報を更新しました!"
    else
      render :edit
    end
  end

  def destroy
    @member.destroy
    redirect_to teams_path, notice: "チームから外れました！"
  end

  private
  def member_params
    params.require(:member).permit(:team_id, :user_id)
  end

  def team_params
    params.require(:team).permit(:id, selected_user_ids: [])
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end
