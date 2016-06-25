class MatchesController < ApplicationController

  def show
    @match = Match.find(params[:id]).decorate
  end

  def index
  	@contest = Contest.find(params[:id])
  end

end