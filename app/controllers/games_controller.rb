class GamesController < ApplicationController
  before_action :assign_parents, only: [:show, :add_home, :add_away]
  def show
    @home = Team.find_by(id: @match.home_team_id)
    @away = Team.find_by(id: @match.away_team_id)
    if @game.ended?

    end
  end

  def create
    @match = Match.find(params[:match_id])
    @game = @match.games.create
    redirect_to match_game_path(@match, @game) if @game.save
  end

  def add_home
    @game.increment!(:home_score)
    if @game.home_score == 10
      @game.update_attribute(:ended, true)
      redirect_to match_path(@match)
    else
      redirect_to match_game_path(@match, @game)
    end
  end

  def add_away
    @game.increment!(:away_score)
    if @game.away_score == 10
      @game.update_attribute(:ended, true)
      redirect_to match_path(@match)
    else
      redirect_to match_game_path(@match, @game)
    end
  end

  def assign_parents
    @match = Match.find(params[:match_id])
    @game = Game.find(params[:id])
  end

  def ends_game

  end
end
