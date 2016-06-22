class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :contest
  
  has_many :guesses

  accepts_nested_attributes_for :user, :reject_if => :all_blank
  
  validates :user, :contest, presence: true

  def to_s
  	user
  end

end
