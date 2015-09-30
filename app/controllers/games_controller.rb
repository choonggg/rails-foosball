class GamesController < ApplicationController
  def show
    @match = Match.find(params[:match_id])
    @game = Game.find(params[:id])
    @home = Team.find_by(id: @match.home_team_id)
    @away = Team.find_by(id: @match.away_team_id)
  end

  def create
    @match = Match.find(params[:match_id])
    @game = @match.games.create
    if @game.save
      redirect_to match_game_path(@match, @game)
    end
  end

  def add_home
    @match = Match.find(params[:match_id])
    @game = Game.find(params[:id])
    @game.increment!(:home_score)
    redirect_to match_game_path(@match, @game)
  end

  def add_away
    @match = Match.find(params[:match_id])
    @game = Game.find(params[:id])
    @game.increment!(:away_score)
    redirect_to match_game_path(@match, @game)
  end
end
