class TeamsController < ApplicationController
  def add_member
    @match = Match.find(params[:match_id])
    @team = Team.find(params[:id])
  end

  def update
    @match = Match.find(params[:match_id])
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      redirect_to match_path(@match)
    end
  end

  def edit
    @match = Match.find(params[:match_id])
    @team = Team.find(params[:id])
  end

  private

  def team_params
    params.require(:team).permit(:team_name, memberships_attributes: [:user_id])
  end
end
