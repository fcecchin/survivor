class Match < ActiveRecord::Base
  include Winnerable

  validates :datetime, presence: true
  validates :tournament, presence: true
  validates :team_a,   presence: true
  validates :team_b,   presence: true

  belongs_to :team_a, class_name: 'Team', primary_key: :id, foreign_key: :team_a_id
  belongs_to :team_b, class_name: 'Team', primary_key: :id, foreign_key: :team_b_id
  belongs_to :tournament

  has_many :guesses

  scope :active, -> { joins(:tournament).where("tournaments.active = ?", true) }
  scope :open_to_guesses, -> { where("datetime > ?", Time.now) }
  scope :tournament_ordered, -> { joins(:tournament).order("tournaments.name") }
  scope :today, -> { where("DATE(datetime) = DATE(?)", Time.now).order(:datetime) }

  def finished?
    !goals_a.nil? && !goals_b.nil?
  end

  def is_open_to_guesses?
    self.datetime > Time.now + 1.hour
  end
  
  def to_s
    "#{team_a} x #{team_b}"
  end
end