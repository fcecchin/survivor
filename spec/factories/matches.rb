FactoryGirl.define do
  
  factory :match do
    datetime Time.now
    team_a
    team_b
    tournament

    factory :future_match do
      datetime Time.now + 2.week.to_i
    end

    factory :past_match do
      datetime Time.now - 2.week.to_i
    end

  end
  
end