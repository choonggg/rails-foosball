class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
    @home = Team.find(@match.home_team_id)
    @away = Team.find(@match.away_team_id)
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(matches_param)
    @team1 = Team.where(team_name: params[:match][:home_team][:team_name]).first_or_create
    @team2 = Team.where(team_name: params[:match][:away_team][:team_name]).first_or_create
    @match.teams << @team1
    @match.teams << @team2
    @match.home_team_id = @team1.id
    @match.away_team_id = @team2.id
    if @match.save
      redirect_to matches_path
    else
      redirect_to :new
    end
  end

  private

  def matches_param
    params.require(:match).permit(:home_team_id, :away_team_id, teams_attributes: [:team_name])
  end
end
