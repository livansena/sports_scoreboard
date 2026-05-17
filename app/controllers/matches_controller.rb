class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def new
    @match = Match.new
    @teams = Team.all
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      redirect_to matches_path
    else
      @teams = Team.all
      render :new
    end
  end

  private

  def match_params
    params.require(:match).permit(
      :home_team_id,
      :away_team_id,
      :home_score,
      :away_score
    )
  end
end