class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :set_team, only: [:index, :new, :create]


  def index
    @members = Member.all
  end

  def new
    @member = Member.new
    @users = @team.none_member_users
  end

  def create
    @team.selected_user_ids = team_params[:selected_user_ids]
    if @team.create_members
      redirect_to teams_path(@team), notice: "メンバーを追加しました！"
    else
      @member = @team.members.build
      @users = @team.none_member_users
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to team_path(@team), notice: "メンバー情報を更新しました!"
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

  def set_member
    @member = Member.find(params[:id])
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end
