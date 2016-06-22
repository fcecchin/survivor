class Contest < ActiveRecord::Base
#   has_many :matches
  has_many :participants
  has_many :users, -> { order('name ASC') },		through: :participants
  has_many :guesses,	through: :participants

  accepts_nested_attributes_for :participants, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :users
  
  belongs_to :owner,  :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :tournament
  
  validates :name, presence: true
  validates :owner, presence: true
  validates :tournament, presence: true

  # boloes jogados por um dado usuario
  scope :actives, -> { where("contests.active = ?", true) }
  scope :played_by, lambda { |user| joins(:participants).where("participants.user_id = #{user.id}").order("name ASC").distinct }

end
