class MembershipsController < ApplicationController
  def destroy
    @match = Match.find(params[:match_id])
    @team = Team.find(params[:team_id])
    @membership = Membership.find(params[:id])
    if @membership.present?
      @membership.destroy
      redirect_to match_path(@match)
    end
  end
end
