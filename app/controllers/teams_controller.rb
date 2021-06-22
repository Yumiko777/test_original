class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :authorized_user?, only:[:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = current_user.teams.build(team_params)
    if @team.save
      Member.create(team_id: @team.id, user_id: current_user.id)
      redirect_to teams_path(@team), notice: "チームを作成しました！"
    else
      render :new
    end
  end

  def edit
    if @team.user != current_user
      redirect_to teams_path, alert: "不正なアクセスです!"
    end
  end

  def show
    @members = @team.members
    # @works = Work.includes(:username).where(member_id: @member.id)
    # redirect_to teams_path, alert: "権限がありません!" unless @team.is_member?(current_user)
  end

  def update
    if @team.update(team_params)
      redirect_to team_path(@team), notice: "チーム情報を更新しました!"
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_path, notice: "チームを削除しました！"
  end

  private
  def team_params
    params.require(:team).permit(:name,user_ids:[])
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def authorized_user?
     unless @team.is_member?(current_user) || current_user.admin
      redirect_to teams_path, alert: "権限がありません!"
    end
  end
end
