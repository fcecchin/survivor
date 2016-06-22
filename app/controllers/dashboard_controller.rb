class DashboardController < ApplicationController

  def index
    @contests = Contest.actives.played_by(current_user)
    @tournaments = Tournament.where("active = ?", true).order("name ASC")
  end

end