class MembersController < ApplicationController
  before_action :authenticate_user!

  def create
    @member = current_user.members.build(member_params)
    if @member.save
      Team.create(member_id: @member.id, user_id: current_user.id)
      redirect_to teams_path(@team), notice: "チームに参加しました！"
    else
      redirect_to teams_path, notice: "チームに参加できません!"
    end
  end

  def destroy
  end

  private
  def member_params
    params.require(:member).permit(:team_id, :user_id)
  end
end
