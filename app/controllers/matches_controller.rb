class MatchesController < ApplicationController

  def show
  	@contest = Contest.find(params[:id])
    @match = Match.find(params[:id]).decorate(context: {user: current_user, contest: @contest})
  end

  def index
  	@contest = Contest.find(params[:id])
  end

end