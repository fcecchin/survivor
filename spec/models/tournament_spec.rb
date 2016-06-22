require 'spec_helper'

describe Tournament do

  let!(:tournament) { build(:tournament) }
  subject{ tournament }

  it { should be_valid }

  its(:active) { should be_true }

  it 'should have a name' do
    tournament.name = nil
    tournament.should_not be_valid
  end

  it 'should have matches' do
    tournament.save
    match_1 = create(:match, tournament: tournament)
    match_2 = create(:match, tournament: tournament)
    tournament.should have(2).matches
  end

  it 'should not have matches' do
    tournament.save
    create(:match)
    tournament.should have(0).matches
  end

end