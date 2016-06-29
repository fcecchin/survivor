class GuessesController < ApplicationController

  def my
    @contest = Contest.find(params[:contest_id])
    @matches_by_round = Match.
                          open_to_guesses.
                          tournament_ordered.
                          order("datetime ASC").
                          decorate(context: {user: current_user, contest: @contest}).
                          group_by(&:round)
  end

  def my_guesses
    # get all open matches including and associates the current user guesses to it
    @contest = Contest.find(params[:contest_id])
    @grouped_matches = Match.
                          open_to_guesses.
                          tournament_ordered.
                          order("datetime ASC").
                          decorate(context: {user: current_user, contest: @contest}).
                          group_by(&:tournament)
  end

  def update
    contest = Contest.find(params[:id])
    participant = Participant.find_by_user_id_and_contest_id(current_user.id, contest.id)
    
    Bolao::Guesses.save(params, participant)
    flash[:success] = t("guesses_page.guesses_saved")
    redirect_to my_guesses_path(contest)
  end
end