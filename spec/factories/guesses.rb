FactoryGirl.define do
  
  factory :guess do
    participant
    match
    goals_a 1
    goals_b 2
  end
  
end