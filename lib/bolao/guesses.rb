module Bolao
  module Guesses

    # Saves the user guesses
    def self.save(params, participant)
   
      params[:guesses].each do |g|
        match = Match.find(g[:match_id]).decorate
        next unless match.is_open_to_guesses?
        
        # avoid creating empty guesses
        next if g[:goals_a].empty? || g[:goals_b].empty?

        if g[:id].empty?
          # Create a new guess if it doesn't exist yet
          p 'teste'
          Guess.create(match_id: g[:match_id], goals_a: g[:goals_a], goals_b: g[:goals_b], participant: g[:participant])
        else
          # Update current guess
          guess = Guess.find_by_id_and_participant_id(g[:id], g[:participant].id)
          guess.update_attributes(goals_a: g[:goals_a], goals_b: g[:goals_b])
        end
      end
    end

  end
end