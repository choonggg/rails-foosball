class GamesController < ApplicationController
  before_action :assign_parents, only: [:show, :add_home, :add_away]
  def show
    @home = Team.find_by(id: @match.home_team_id)
    @away = Team.find_by(id: @match.away_team_id)
  end

  def create
    @match = Match.find(params[:match_id])
    @game = @match.games.create
    redirect_to match_game_path(@match, @game) if @game.save
  end

  def add_home
    @game.increment!(:home_score)
    @home = Team.find_by(id: @match.home_team_id)
    if @game.home_score == 10
      @game.update_attributes(ended: true, winner_id: @home.id, winner_name: @home.team_name)
      redirect_to match_path(@match)
    else
      redirect_to match_game_path(@match, @game)
    end
  end

  def add_away
    @game.increment!(:away_score)
    @away = Team.find_by(id: @match.away_team_id)
    if @game.away_score == 10
      @game.update_attributes(ended: true, winner_id: @away.id, winner_name: @away.team_name)
      redirect_to match_path(@match)
    else
      redirect_to match_game_path(@match, @game)
    end
  end

  def assign_parents
    @match = Match.find(params[:match_id])
    @game = Game.find(params[:id])
  end
end
