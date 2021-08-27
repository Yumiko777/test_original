class Teams::ApplicationController < ApplicationController
  before_action :set_team

  private

  def set_team
    @team = current_user.teams.find(params[:team_id])
  end
end
